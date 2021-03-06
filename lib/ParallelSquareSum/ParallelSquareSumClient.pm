package ParallelSquareSum::ParallelSquareSumClient;

use JSON::RPC::Client;
use POSIX;
use strict;
use Data::Dumper;
use URI;
use Bio::KBase::Exceptions;
my $get_time = sub { time, 0 };
eval {
    require Time::HiRes;
    $get_time = sub { Time::HiRes::gettimeofday() };
};

use Bio::KBase::AuthToken;

# Client version should match Impl version
# This is a Semantic Version number,
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

ParallelSquareSum::ParallelSquareSumClient

=head1 DESCRIPTION


A KBase module: ParallelSquareSum


=cut

sub new
{
    my($class, $url, @args) = @_;
    

    my $self = {
	client => ParallelSquareSum::ParallelSquareSumClient::RpcClient->new,
	url => $url,
	headers => [],
    };

    chomp($self->{hostname} = `hostname`);
    $self->{hostname} ||= 'unknown-host';

    #
    # Set up for propagating KBRPC_TAG and KBRPC_METADATA environment variables through
    # to invoked services. If these values are not set, we create a new tag
    # and a metadata field with basic information about the invoking script.
    #
    if ($ENV{KBRPC_TAG})
    {
	$self->{kbrpc_tag} = $ENV{KBRPC_TAG};
    }
    else
    {
	my ($t, $us) = &$get_time();
	$us = sprintf("%06d", $us);
	my $ts = strftime("%Y-%m-%dT%H:%M:%S.${us}Z", gmtime $t);
	$self->{kbrpc_tag} = "C:$0:$self->{hostname}:$$:$ts";
    }
    push(@{$self->{headers}}, 'Kbrpc-Tag', $self->{kbrpc_tag});

    if ($ENV{KBRPC_METADATA})
    {
	$self->{kbrpc_metadata} = $ENV{KBRPC_METADATA};
	push(@{$self->{headers}}, 'Kbrpc-Metadata', $self->{kbrpc_metadata});
    }

    if ($ENV{KBRPC_ERROR_DEST})
    {
	$self->{kbrpc_error_dest} = $ENV{KBRPC_ERROR_DEST};
	push(@{$self->{headers}}, 'Kbrpc-Errordest', $self->{kbrpc_error_dest});
    }

    #
    # This module requires authentication.
    #
    # We create an auth token, passing through the arguments that we were (hopefully) given.

    {
	my $token = Bio::KBase::AuthToken->new(@args);
	
	if (!$token->error_message)
	{
	    $self->{token} = $token->token;
	    $self->{client}->{token} = $token->token;
	}
        else
        {
	    #
	    # All methods in this module require authentication. In this case, if we
	    # don't have a token, we can't continue.
	    #
	    die "Authentication failed: " . $token->error_message;
	}
    }

    my $ua = $self->{client}->ua;	 
    my $timeout = $ENV{CDMI_TIMEOUT} || (30 * 60);	 
    $ua->timeout($timeout);
    bless $self, $class;
    #    $self->_validate_version();
    return $self;
}




=head2 calcSquareSum

  $return = $obj->calcSquareSum($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a ParallelSquareSum.CalcSquareSumParams
$return is a ParallelSquareSum.CalcSquareSumInputOutput
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumInputOutput is a reference to a hash where the following keys are defined:
	square_sum has a value which is an int

</pre>

=end html

=begin text

$params is a ParallelSquareSum.CalcSquareSumParams
$return is a ParallelSquareSum.CalcSquareSumInputOutput
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumInputOutput is a reference to a hash where the following keys are defined:
	square_sum has a value which is an int


=end text

=item Description



=back

=cut

 sub calcSquareSum
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function calcSquareSum (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to calcSquareSum:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'calcSquareSum');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "ParallelSquareSum.calcSquareSum",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'calcSquareSum',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method calcSquareSum",
					    status_line => $self->{client}->status_line,
					    method_name => 'calcSquareSum',
				       );
    }
}
 


=head2 calcSquareSumPrepare

  $return = $obj->calcSquareSumPrepare($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a ParallelSquareSum.CalcSquareSumPrepareParams
$return is a ParallelSquareSum.CalcSquareSumPrepareSchedule
CalcSquareSumPrepareParams is a reference to a hash where the following keys are defined:
	global_method has a value which is a ParallelSquareSum.FullMethodQualifier
	global_input_params has a value which is a ParallelSquareSum.CalcSquareSumParams
FullMethodQualifier is a reference to a hash where the following keys are defined:
	module_name has a value which is a string
	method_name has a value which is a string
	service_ver has a value which is a string
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumPrepareSchedule is a reference to a hash where the following keys are defined:
	tasks has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumRunEachInput
	collect_method has a value which is a ParallelSquareSum.FullMethodQualifier
CalcSquareSumRunEachInput is a reference to a hash where the following keys are defined:
	method has a value which is a ParallelSquareSum.FullMethodQualifier
	input_arguments has a value which is a reference to a list containing 1 item:
		0: a ParallelSquareSum.CalcSquareSumTask

CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int

</pre>

=end html

=begin text

$params is a ParallelSquareSum.CalcSquareSumPrepareParams
$return is a ParallelSquareSum.CalcSquareSumPrepareSchedule
CalcSquareSumPrepareParams is a reference to a hash where the following keys are defined:
	global_method has a value which is a ParallelSquareSum.FullMethodQualifier
	global_input_params has a value which is a ParallelSquareSum.CalcSquareSumParams
FullMethodQualifier is a reference to a hash where the following keys are defined:
	module_name has a value which is a string
	method_name has a value which is a string
	service_ver has a value which is a string
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumPrepareSchedule is a reference to a hash where the following keys are defined:
	tasks has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumRunEachInput
	collect_method has a value which is a ParallelSquareSum.FullMethodQualifier
CalcSquareSumRunEachInput is a reference to a hash where the following keys are defined:
	method has a value which is a ParallelSquareSum.FullMethodQualifier
	input_arguments has a value which is a reference to a list containing 1 item:
		0: a ParallelSquareSum.CalcSquareSumTask

CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int


=end text

=item Description



=back

=cut

 sub calcSquareSumPrepare
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function calcSquareSumPrepare (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to calcSquareSumPrepare:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'calcSquareSumPrepare');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "ParallelSquareSum.calcSquareSumPrepare",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'calcSquareSumPrepare',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method calcSquareSumPrepare",
					    status_line => $self->{client}->status_line,
					    method_name => 'calcSquareSumPrepare',
				       );
    }
}
 


=head2 calcSquareSumRunEach

  $return = $obj->calcSquareSumRunEach($task)

=over 4

=item Parameter and return types

=begin html

<pre>
$task is a ParallelSquareSum.CalcSquareSumTask
$return is a ParallelSquareSum.CalcSquareSumRunEachOutput
CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int
CalcSquareSumRunEachOutput is a reference to a hash where the following keys are defined:
	i_squre has a value which is an int

</pre>

=end html

=begin text

$task is a ParallelSquareSum.CalcSquareSumTask
$return is a ParallelSquareSum.CalcSquareSumRunEachOutput
CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int
CalcSquareSumRunEachOutput is a reference to a hash where the following keys are defined:
	i_squre has a value which is an int


=end text

=item Description



=back

=cut

 sub calcSquareSumRunEach
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function calcSquareSumRunEach (received $n, expecting 1)");
    }
    {
	my($task) = @args;

	my @_bad_arguments;
        (ref($task) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"task\" (value was \"$task\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to calcSquareSumRunEach:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'calcSquareSumRunEach');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "ParallelSquareSum.calcSquareSumRunEach",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'calcSquareSumRunEach',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method calcSquareSumRunEach",
					    status_line => $self->{client}->status_line,
					    method_name => 'calcSquareSumRunEach',
				       );
    }
}
 


=head2 calcSquareSumCollect

  $return = $obj->calcSquareSumCollect($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a ParallelSquareSum.CalcSquareSumCollectInput
$return is a ParallelSquareSum.CalcSquareSumInputOutput
CalcSquareSumCollectInput is a reference to a hash where the following keys are defined:
	global_params has a value which is a ParallelSquareSum.CalcSquareSumParams
	input_result_pairs has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumInputResultPair
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumInputResultPair is a reference to a hash where the following keys are defined:
	input has a value which is a ParallelSquareSum.CalcSquareSumRunEachInput
	result has a value which is a ParallelSquareSum.CalcSquareSumRunEachOutput
CalcSquareSumRunEachInput is a reference to a hash where the following keys are defined:
	method has a value which is a ParallelSquareSum.FullMethodQualifier
	input_arguments has a value which is a reference to a list containing 1 item:
		0: a ParallelSquareSum.CalcSquareSumTask

FullMethodQualifier is a reference to a hash where the following keys are defined:
	module_name has a value which is a string
	method_name has a value which is a string
	service_ver has a value which is a string
CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int
CalcSquareSumRunEachOutput is a reference to a hash where the following keys are defined:
	i_squre has a value which is an int
CalcSquareSumInputOutput is a reference to a hash where the following keys are defined:
	square_sum has a value which is an int

</pre>

=end html

=begin text

$params is a ParallelSquareSum.CalcSquareSumCollectInput
$return is a ParallelSquareSum.CalcSquareSumInputOutput
CalcSquareSumCollectInput is a reference to a hash where the following keys are defined:
	global_params has a value which is a ParallelSquareSum.CalcSquareSumParams
	input_result_pairs has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumInputResultPair
CalcSquareSumParams is a reference to a hash where the following keys are defined:
	n has a value which is an int
CalcSquareSumInputResultPair is a reference to a hash where the following keys are defined:
	input has a value which is a ParallelSquareSum.CalcSquareSumRunEachInput
	result has a value which is a ParallelSquareSum.CalcSquareSumRunEachOutput
CalcSquareSumRunEachInput is a reference to a hash where the following keys are defined:
	method has a value which is a ParallelSquareSum.FullMethodQualifier
	input_arguments has a value which is a reference to a list containing 1 item:
		0: a ParallelSquareSum.CalcSquareSumTask

FullMethodQualifier is a reference to a hash where the following keys are defined:
	module_name has a value which is a string
	method_name has a value which is a string
	service_ver has a value which is a string
CalcSquareSumTask is a reference to a hash where the following keys are defined:
	i has a value which is an int
CalcSquareSumRunEachOutput is a reference to a hash where the following keys are defined:
	i_squre has a value which is an int
CalcSquareSumInputOutput is a reference to a hash where the following keys are defined:
	square_sum has a value which is an int


=end text

=item Description



=back

=cut

 sub calcSquareSumCollect
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function calcSquareSumCollect (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to calcSquareSumCollect:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'calcSquareSumCollect');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "ParallelSquareSum.calcSquareSumCollect",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'calcSquareSumCollect',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method calcSquareSumCollect",
					    status_line => $self->{client}->status_line,
					    method_name => 'calcSquareSumCollect',
				       );
    }
}
 
  
sub status
{
    my($self, @args) = @_;
    if ((my $n = @args) != 0) {
        Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
                                   "Invalid argument count for function status (received $n, expecting 0)");
    }
    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
        method => "ParallelSquareSum.status",
        params => \@args,
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
                           code => $result->content->{error}->{code},
                           method_name => 'status',
                           data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
                          );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method status",
                        status_line => $self->{client}->status_line,
                        method_name => 'status',
                       );
    }
}
   

sub version {
    my ($self) = @_;
    my $result = $self->{client}->call($self->{url}, $self->{headers}, {
        method => "ParallelSquareSum.version",
        params => [],
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(
                error => $result->error_message,
                code => $result->content->{code},
                method_name => 'calcSquareSumCollect',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method calcSquareSumCollect",
            status_line => $self->{client}->status_line,
            method_name => 'calcSquareSumCollect',
        );
    }
}

sub _validate_version {
    my ($self) = @_;
    my $svr_version = $self->version();
    my $client_version = $VERSION;
    my ($cMajor, $cMinor) = split(/\./, $client_version);
    my ($sMajor, $sMinor) = split(/\./, $svr_version);
    if ($sMajor != $cMajor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Major version numbers differ.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor < $cMinor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Client minor version greater than Server minor version.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor > $cMinor) {
        warn "New client version available for ParallelSquareSum::ParallelSquareSumClient\n";
    }
    if ($sMajor == 0) {
        warn "ParallelSquareSum::ParallelSquareSumClient version is $svr_version. API subject to change.\n";
    }
}

=head1 TYPES



=head2 CalcSquareSumParams

=over 4



=item Description

===================== main =====================


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
n has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
n has a value which is an int


=end text

=back



=head2 CalcSquareSumInputOutput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
square_sum has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
square_sum has a value which is an int


=end text

=back



=head2 FullMethodQualifier

=over 4



=item Description

===================== prepare =====================


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
module_name has a value which is a string
method_name has a value which is a string
service_ver has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
module_name has a value which is a string
method_name has a value which is a string
service_ver has a value which is a string


=end text

=back



=head2 CalcSquareSumPrepareParams

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
global_method has a value which is a ParallelSquareSum.FullMethodQualifier
global_input_params has a value which is a ParallelSquareSum.CalcSquareSumParams

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
global_method has a value which is a ParallelSquareSum.FullMethodQualifier
global_input_params has a value which is a ParallelSquareSum.CalcSquareSumParams


=end text

=back



=head2 CalcSquareSumTask

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
i has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
i has a value which is an int


=end text

=back



=head2 CalcSquareSumRunEachInput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
method has a value which is a ParallelSquareSum.FullMethodQualifier
input_arguments has a value which is a reference to a list containing 1 item:
	0: a ParallelSquareSum.CalcSquareSumTask


</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
method has a value which is a ParallelSquareSum.FullMethodQualifier
input_arguments has a value which is a reference to a list containing 1 item:
	0: a ParallelSquareSum.CalcSquareSumTask



=end text

=back



=head2 CalcSquareSumPrepareSchedule

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
tasks has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumRunEachInput
collect_method has a value which is a ParallelSquareSum.FullMethodQualifier

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
tasks has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumRunEachInput
collect_method has a value which is a ParallelSquareSum.FullMethodQualifier


=end text

=back



=head2 CalcSquareSumRunEachOutput

=over 4



=item Description

===================== runEach =====================


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
i_squre has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
i_squre has a value which is an int


=end text

=back



=head2 CalcSquareSumInputResultPair

=over 4



=item Description

===================== collect =====================


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
input has a value which is a ParallelSquareSum.CalcSquareSumRunEachInput
result has a value which is a ParallelSquareSum.CalcSquareSumRunEachOutput

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
input has a value which is a ParallelSquareSum.CalcSquareSumRunEachInput
result has a value which is a ParallelSquareSum.CalcSquareSumRunEachOutput


=end text

=back



=head2 CalcSquareSumCollectInput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
global_params has a value which is a ParallelSquareSum.CalcSquareSumParams
input_result_pairs has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumInputResultPair

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
global_params has a value which is a ParallelSquareSum.CalcSquareSumParams
input_result_pairs has a value which is a reference to a list where each element is a ParallelSquareSum.CalcSquareSumInputResultPair


=end text

=back



=cut

package ParallelSquareSum::ParallelSquareSumClient::RpcClient;
use base 'JSON::RPC::Client';
use POSIX;
use strict;

#
# Override JSON::RPC::Client::call because it doesn't handle error returns properly.
#

sub call {
    my ($self, $uri, $headers, $obj) = @_;
    my $result;


    {
	if ($uri =~ /\?/) {
	    $result = $self->_get($uri);
	}
	else {
	    Carp::croak "not hashref." unless (ref $obj eq 'HASH');
	    $result = $self->_post($uri, $headers, $obj);
	}

    }

    my $service = $obj->{method} =~ /^system\./ if ( $obj );

    $self->status_line($result->status_line);

    if ($result->is_success) {

        return unless($result->content); # notification?

        if ($service) {
            return JSON::RPC::ServiceObject->new($result, $self->json);
        }

        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    elsif ($result->content_type eq 'application/json')
    {
        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    else {
        return;
    }
}


sub _post {
    my ($self, $uri, $headers, $obj) = @_;
    my $json = $self->json;

    $obj->{version} ||= $self->{version} || '1.1';

    if ($obj->{version} eq '1.0') {
        delete $obj->{version};
        if (exists $obj->{id}) {
            $self->id($obj->{id}) if ($obj->{id}); # if undef, it is notification.
        }
        else {
            $obj->{id} = $self->id || ($self->id('JSON::RPC::Client'));
        }
    }
    else {
        # $obj->{id} = $self->id if (defined $self->id);
	# Assign a random number to the id if one hasn't been set
	$obj->{id} = (defined $self->id) ? $self->id : substr(rand(),2);
    }

    my $content = $json->encode($obj);

    $self->ua->post(
        $uri,
        Content_Type   => $self->{content_type},
        Content        => $content,
        Accept         => 'application/json',
	@$headers,
	($self->{token} ? (Authorization => $self->{token}) : ()),
    );
}



1;
