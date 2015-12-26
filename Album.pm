package Album;

use Mac::iTunes::Library::Item;
use strict;
use List::Util qw[min max];
use Date::Calc qw(Date_to_Time);

# iTunes uses 1904 instead of 1970 as the time epoch
# Use values pulled from an actual iTunes file to calc the diffeerence
# We Will use this later to prevent replaying songs that were played yesterday
my $iTime = 3379181040;
my $uTime = Date_to_Time(2011,01,30,5,24,00);
my $timeAdj = $iTime - $uTime;

sub new {
    my $proto = shift;
    my$class = ref($proto) || $proto;
    my $self = {};
    $self->{NAME} = undef;
    $self->{TIME} = undef;
    $self->{SONGS} = [];
    bless($self, $class);
    return $self;
}

sub name {
    my $self = shift;
    if (@_) { $self->{NAME} = shift }
    return $self->{NAME};
}

# Album time is the earliest of all the song playtimes
sub time {
    my $self = shift;
    return $self->{TIME};
}

sub size {
    my $self = shift;
    return $self->{SIZE};
}


sub songs {
    my $self = shift;
    return @{ $self->{SONGS} };
}

sub addSong {
    my $self = shift;
    my $item = shift;

    push(@{$self->{SONGS}}, $item);
    my @temp = @{$self->{SONGS}};
    if (defined $self->{TIME}) { 
        $self->{TIME} = min($self->{TIME}, $item->playDate);
    } else {
        $self->{TIME} = @{$self->{SONGS}}[0]->playDate;
    }
    $self->{SIZE} += $item->size;
}

1;  # so the require or use succeeds
