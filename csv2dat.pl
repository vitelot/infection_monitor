#! /usr/bin/perl -w

%Tot=();
<>; # remove header
while(<>) {
  s/"//g; #remove ""
  (@field) = split /,/;
  $date = $field[1];
  $val = $field[2];
  #print "$date [$val]\n";
  $Tot{$date} += $val;
}

$i = 0;
for (sort keys %Tot) {
  $i++;
  print "$i $Tot{$_} $_\n";
}
