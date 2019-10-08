#!/usr/bin/perl
#(C)opyright - MRLINKERRORSYSTEM
#Github+Twitter > @HackerMrlinkerrorsystem
system ("title Proxy Grabber By Mrlinkerrorsystem ");
if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }
use if $^O eq "MSWin32", Win32::Console::ANSI;
use LWP::Simple;
use Getopt::Long;
use HTTP::Request;
use threads;
use LWP::UserAgent;
use IO::Select;
use HTTP::Cookies;
use HTTP::Response;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);
use URI::URL;
use IO::Socket;
use IO::Socket::INET;
use HTTP::Request;
use HTTP::Request::Common qw(GET);
#UserAgent
$usrag = LWP::UserAgent->new(keep_alive => 1);
$usrag->timeout (15);
$usrag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
#time setting
($second, $minute, $hour, $dayOfMonth, $month) = localtime();
#work
$month++;
$chhar="$month-$dayOfMonth";
$taww="$hour-$minute-$second";
if (-e "Proxiez"){}else{mkdir "Proxiez" or die "Try To Make a dictory named 'Proxiez' -_- Bakka";}
if (-e $chhar){}else{mkdir "Proxiez/$chhar" or die "Try To Make a dictory named Proxiez/$chhar -_- Bakka";}
sub proxyy(){
$linko="http://www.proxyserverlist24.top";
$i=0;
$rr=$usrag->get($linko)->content;
while ($rr=~m/<a href='http:\/\/www.proxyserverlist24.top\/2019\/(.*?)'/g){
chomp $1;
$rlinko="http://www.proxyserverlist24.top/2019/".$1;
$rre=$usrag->get($rlinko)->content;
while ($rre=~m/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,4})/g){
print color('bold green'),"~>".$1."\n";
open(save, ">>Proxiez/$chhar/proxy-$taww-by-M4rk.txt");
print save $1."\n";
close(save);
}
$i++;
if ($i=3){$linko=$usrag->get($linko)->content=~/<a class=\'blog-pager-older-link' href=\'(.*)' id=\'Blog1_blog-pager-older-link' title=\'Older Posts'>Older Posts<\/a>/;
$i=0;
print $1;
}
}
}
$thr=200;
push(@threads, threads->create (\&proxyy));
sleep(1) while(scalar threads->list(threads::running) >= $thr);
eval {
$_->join foreach @threads;
@threads = ();}


