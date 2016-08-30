use mccorkleReadUtilsTestPerl::mccorkleReadUtilsTestPerlImpl;

use mccorkleReadUtilsTestPerl::mccorkleReadUtilsTestPerlServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = mccorkleReadUtilsTestPerl::mccorkleReadUtilsTestPerlImpl->new;
    push(@dispatch, 'mccorkleReadUtilsTestPerl' => $obj);
}


my $server = mccorkleReadUtilsTestPerl::mccorkleReadUtilsTestPerlServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
