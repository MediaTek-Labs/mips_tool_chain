#!/usr/bin/perl

use strict;

my $elf = $ARGV[0];
my $in;
if (! -f $elf) {
    print STDERR ("Cannot find ELF file '$elf'\n");
    exit(1);
}
open($in, "nanomips-elf-objdump -d -w -M show-arch-insn '$elf' |");
if (!$in) {
    print STDERR ("Cannot disassemble ELF '$elf'\n");
    exit(1);
}


# 1.      [30:29][26][14][12][0]==6'b011111 AND
my $majorMask = 0;
my $majorMaskedVal = 0;
for ([30, 0],
     [29, 1],
     [26, 1],
     [14, 1],
     [12, 1],
     [0, 1])  {
    $majorMask |= (1 << $_->[0]);
    $majorMaskedVal |= ((1&$_->[1]) << $_->[0]);
}

# 2.      [10:8]==3'b001 OR [9]==1'b1
my $minorMask1 = 0;
my $minorMaskedVal1 = 0;
for ([10, 0],
     [9, 0],
     [8, 1])  {
    $minorMask1 |= (1 << $_->[0]);
    $minorMaskedVal1 |= ((1&$_->[1]) << $_->[0]);
}
my $minorMask2 = 0;
my $minorMaskedVal2 = 0;
for ([9, 1])  {
    $minorMask2 |= (1 << $_->[0]);
    $minorMaskedVal2 |= ((1&$_->[1]) << $_->[0]);
}

printf("Major mask: 0x%x value 0x%x\n", $majorMask, $majorMaskedVal);
printf("Minor mask 1: 0x%x value 0x%x\n", $minorMask1, $minorMaskedVal1);
printf("Minor mask 2: 0x%x value 0x%x\n", $minorMask2, $minorMaskedVal2);


sub immediateTriggersBug ($) {
    my ($imm) = @_;
    $imm = ((0xffff & $imm) << 16) + (($imm >> 16) & 0xffff);
    return (($imm & $majorMask) == $majorMaskedVal
	    && (($imm & $minorMask1) == $minorMaskedVal1
		|| ($imm & $minorMask2) == $minorMaskedVal2));
}


my $count_48 = 0;
my $count_bugs = 0;
my %counts;

for (<$in>) {
    # Relies on -M show-arch-insn
    if (/\[.*48.*\]/) {
	# Extract immediate from hex encoding
	my $x = "[a-f0-9]";
	my $xxxx = "$x$x$x$x";
	if (/^\s*([a-f0-9]+):\s+([a-f0-9]{4})\s+([a-f0-9]{4})\s+([a-f0-9]{4})\s+([^\s]+)/) {

	    my $immediate = hex("$4$3");
	    my $encoding = hex("$3$4");
	    my $pc = hex($1);
	    my $opcode = $5;
	    # printf("imm 0x%x -- %s", $immediate, $_);

	    $count_48++;

	    if (immediateTriggersBug($immediate)) {
		if ($opcode eq 'lwpc[48]') {
		    # LWPC does not trigger the bug.
		} else {
		    $count_bugs++;
		    $counts{$opcode} ++;
		    printf("Encoding 0x%x (%s) triggers immediate bug: %s", $encoding, $opcode, $_);

		    if (/li.48..*(0x[0-9a-f]+)/) {
			# Can we convert to addiupc?
			my $pc_rel_imm = $immediate - $pc;
			if (immediateTriggersBug($immediate)) {
			    $counts{$opcode.":no_pcrel_workaround"}++;
			} else {
			    $counts{$opcode.":pcrel_workaround"}++;
			}
		    } elsif (/addiu.48..*([0-9]+)/) {
			my $pc_rel_imm = $immediate - $pc;
			if (immediateTriggersBug($immediate)) {
			    $counts{$opcode.":no_pcrel_workaround"}++;
			} else {
			    $counts{$opcode.":pcrel_workaround"}++;
			}
		    } elsif ($opcode eq 'lapc[48]' || $opcode eq 'swpc[48]') {
			my $abs_imm = $immediate + $pc;
			if (immediateTriggersBug($abs_imm)) {
			    $counts{$opcode.":no_abs_workaround"}++;
			} else {
			    $counts{$opcode.":abs_workaround"}++;
			}
		    } else {
			print("XXX Unknown: $_\n");
		    }
		}
	    }
	} else {
	    print STDERR ("XXX Can't get bytes from: $_");
	    exit(1)
	}
	
    }
}

print("Count: $count_48 bugs $count_bugs\n");
for (keys %counts) {
    print "$_: ".$counts{$_}."\n";
}

use Data::Dumper;
