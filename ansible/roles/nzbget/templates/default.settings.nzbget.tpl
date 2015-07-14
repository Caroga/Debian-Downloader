# Sample configuration file for NZBGet
#
# On POSIX put this file to one of the following locations:
# ~/.nzbget
# /etc/nzbget.conf
# /usr/etc/nzbget.conf
# /usr/local/etc/nzbget.conf
# /opt/etc/nzbget.conf
#
# On Windows put this file in program's directory.
#
# You can also put the file into any location, if you specify the path to it
# using switch "-c", e.g:
#   nzbget -c /home/user/myconfig.txt

# For quick start change the option MainDir and configure one news-server


##############################################################################
### PATHS                                                                  ###

# Root directory for all tasks.
#
# On POSIX you can use "~" as alias for home directory (e.g. "~/downloads").
# On Windows use absolute paths (e.g. "C:\Downloads").
MainDir={{nzbget.download_dir}}

# Destination directory for downloaded files.
#
# If you want to distinguish between partially downloaded files and
# completed downloads, use also option <InterDir>.
DestDir=${MainDir}/dst

# Directory to store intermediate files.
#
# If this option is set (not empty) the files are downloaded into
# this directory first. After successful download of nzb-file (possibly
# after par-repair) the files are moved to destination directory
# (option <DestDir>). If download or unpack fail the files remain in
# intermediate directory.
#
# Using of intermediate directory can significantly improve unpack
# performance if you can put intermediate directory (option <InterDir>)
# and destination directory (option <DestDir>) on separate physical
# hard drives.
#
# NOTE: If the option <InterDir> is set to empty value the downloaded
# files are put directly to destination directory (option <DestDir>).
InterDir=${MainDir}/inter

# Directory for incoming nzb-files.
#
# If a new nzb-file is added to queue via web-interface or RPC-API, it
# is saved into this directory and then processed by pre-processing
# script (option <ScanScript>).
#
# This directory is also monitored for new nzb-files. If a new file
# is found it is added to download queue. The directory can have
# sub-directories. A nzb-file queued from a subdirectory is automatically
# assigned to category with sub-directory-name.
NzbDir=${MainDir}/nzb

# Directory to store program state.
#
# This directory is used to save download queue, history, information
# about fetched RSS feeds, statistics, etc.
QueueDir=${MainDir}/queue

# Directory to store temporary files.
TempDir=${MainDir}/tmp

# Directory with web-interface files.
#
# Example: /usr/local/share/nzbget/webui.
#
# NOTE: To disable web-interface set the option to an empty value.
# This however doesn't disable the built-in web-server completely because
# it is also used to serve JSON-/XML-RPC requests.
WebDir=/usr/share/nzbget/webui

# Directory with post-processing and other scripts.
#
# NOTE: For information on writing scripts visit http://nzbget.net/Extension_scripts.
ScriptDir=${MainDir}/scripts

# Lock-file for daemon-mode, POSIX only.
#
# If the option is not empty, NZBGet creates the file and writes process-id
# (PID) into it. That info can be used in shell scripts.
LockFile=${MainDir}/nzbget.lock

# Where to store log file, if it needs to be created.
#
# NOTE: See also option <CreateLog>.
LogFile=${DestDir}/nzbget.log

# Configuration file template.
#
# Put the path to the example configuration file which comes with
# NZBGet. Web-interface needs this file to read option descriptions.
#
# Do not put here your actual configuration file (typically stored
# in your home directory or in /etc/nzbget.conf) but instead the unchanged
# example configuration file (typically installed to
# /usr/local/share/nzbget/nzbget.conf).
#
# Example: /usr/local/share/nzbget/nzbget.conf.
ConfigTemplate=


##############################################################################
### NEWS-SERVERS                                                           ###

# This section defines which servers NZBGet should connect to.
#
# The servers should be numbered subsequently without holes.
# For example if you configure three servers you should name them as Server1,
# Server2 and Server3. If you need to delete Server2 later you should also
# change the name of Server3 to Server2. Otherwise it will not be properly
# read from the config file. Server number doesn't affect its priority (level).

# Use this news server (yes, no).
#
# Set to "no" to temporary disable the server.
Server1.Active=yes

# Name of news server.
#
# The name is used in UI and for logging. It can be any string, you
# may even leave it empty.
Server1.Name=

# Level (priority) of news server (0-99).
#
# The servers are ordered by their level. NZBGet first tries to download
# an article from one (any) of level-0-servers. If that server fails,
# NZBGet tries all other level-0-servers. If all servers fail, it proceeds
# with the level-1-servers, etc.
#
# Put your major download servers at level 0 and your fill servers at
# levels 1, 2, etc..
#
# Several servers with the same level may be defined, they have
# the same priority.
Server1.Level=0

# Group of news server (0-99).
#
# If you have multiple accounts with same conditions (retention, etc.)
# on the same news server, set the same group (greater than 0) for all
# of them. If download fails on one news server, NZBGet does not try
# other servers from the same group.
#
# Value "0" means no group defined (default).
Server1.Group=0

# Host name of news server.
Server1.Host=my.newsserver.com

# Port to connect to (1-65535).
Server1.Port=119

# User name to use for authentication.
Server1.Username=user

# Password to use for authentication.
Server1.Password=pass

# Server requires "Join Group"-command (yes, no).
Server1.JoinGroup=no

# Encrypted server connection (TLS/SSL) (yes, no).
#
# NOTE: By changing this option you should also change the option <ServerX.Port>
# accordingly because unsecure and encrypted connections use different ports.
Server1.Encryption=no

# Cipher to use for encrypted server connection.
#
# By default (when the option is empty) the underlying encryption library
# chooses the cipher automatically. To achieve the best performance
# however you can manually select a faster cipher.
#
# See http://nzbget.net/Choosing_a_cipher for details.
#
# NOTE: One of the fastest cipher is RC4, it also provides strong 128 bit
# encryption. To select it use the cipher string "RC4-MD5" (if NZBGet was
# configured to use OpenSSL) or "NONE:+VERS-TLS-ALL:+ARCFOUR-128:+RSA:+MD5:+COMP-ALL"
# (if NZBGet was configured to use GnuTLS).
#
# NOTE: You may get a TLS handshake error if the news server does
# not support the chosen cipher. You can also get an error "Could not
# select cipher for TLS" if the cipher string is not valid.
Server1.Cipher=

# Maximum number of simultaneous connections to this server (0-999).
Server1.Connections=4

# Second server, on level 0.

#Server2.Level=0
#Server2.Host=my2.newsserver.com
#Server2.Port=119
#Server2.Username=me
#Server2.Password=mypass
#Server2.JoinGroup=yes
#Server2.Connections=4

# Third server, on level 1.

#Server3.Level=1
#Server3.Host=fills.newsserver.com
#Server3.Port=119
#Server3.Username=me2
#Server3.Password=mypass2
#Server3.JoinGroup=yes
#Server3.Connections=1


##############################################################################
### SECURITY                                                               ###

# IP on which NZBGet server listen and which clients use to contact NZBGet.
#
# It could be a dns-hostname (e. g. "mypc") or an ip-address (e. g. "192.168.1.2" or
# "127.0.0.1"). An IP-address is more effective because does not require dns-lookup.
#
# Your computer may have multiple network interfaces and therefore multiple IP
# addresses. If you want NZBGet to listen to all interfaces and be available from
# all IP-addresses use value "0.0.0.0".
#
# NOTE: When you start NZBGet as client (to send remote commands to NZBGet server) and
# the option <ControlIP> is set to "0.0.0.0" the client will use IP "127.0.0.1".
#
# NOTE: If you set the option to "127.0.0.1" you will be able to connect to NZBGet
# only from the computer running NZBGet. This restriction applies to web-interface too.
ControlIP=0.0.0.0

# Port which NZBGet server and remote client use (1-65535).
#
# NOTE: The communication via this port is not encrypted. For encrypted
# communication see option <SecurePort>.
ControlPort=6789

# User name which NZBGet server and remote client use.
#
# Set to empty value to disable user name check (check only password).
#
# NOTE: This option was added in NZBGet 11. Older versions used predefined
# not changeable user name "nzbget". Third-party tools or web-sites written
# for older NZBGet versions may not have an option to define user name. In
# this case you should set option <ControlUsername> to the default value
# "nzbget" or use empty value.
ControlUsername=nzbget

# Password which NZBGet server and remote client use.
#
# Set to empty value to disable authorization request.
ControlPassword=tegbzn6789

# Secure control of NZBGet server (yes, no).
#
# Activate the option if you want to access NZBGet built-in web-server
# via HTTPS (web-interface and RPC). You should also provide certificate
# and key files, see option <SecureCert> and option <SecureKey>.
SecureControl=no

# Port which NZBGet server and remote client use for encrypted
# communication (1-65535).
SecurePort=6791

# Full path to certificate file for encrypted communication.
SecureCert=

# Full path to key file for encrypted communication.
SecureKey=

# IP-addresses allowed to connect without authorization.
#
# Comma separated list of privileged IPs for easy access to NZBGet
# built-in web-server (web-interface and RPC).
#
# Example: 127.0.0.1,192.168.178.2.
#
# NOTE: Do not use this option if the program works behind another
# web-server because all requests will have the address of this server.
AuthorizedIP=

# User name for daemon-mode, POSIX only.
#
# Set the user that the daemon normally runs at (POSIX in daemon-mode only).
# Set MainDir with an absolute path to be sure where it will write.
# This allows NZBGet daemon to be launched in rc.local (at boot), and
# download items as a specific user id.
#
# NOTE: This option has effect only if the program was started from
# root-account, otherwise it is ignored and the daemon runs under
# current user id.
DaemonUsername=root

# Specify default umask (affects file permissions) for newly created
# files, POSIX only (000-1000).
#
# The value should be written in octal form (the same as for "umask" shell
# command).
# Empty value or value "1000" disable the setting of umask-mode; current
# umask-mode (set via shell) is used in this case.
UMask=1000


##############################################################################
### CATEGORIES                                                             ###

# This section defines categories available in web-interface.

# Category name.
#
# Each nzb-file can be assigned to a category.
# Category name is passed to post-processing script and can be used by it
# to perform category specific processing.
Category1.Name=Movies

# Destination directory for this category.
#
# If this option is empty, then the default destination directory
# (option <DestDir>) is used. In this case if the option <AppendCategoryDir>
# is active, the program creates a subdirectory with category name within
# destination directory.
Category1.DestDir=

# Unpack downloaded nzb-files (yes, no).
#
# For more information see global option <Unpack>.
Category1.Unpack=yes

# Default list of post-processing scripts.
#
# For more information see global option <PostScript>.
Category1.PostScript=

# List of aliases.
#
# When a nzb-file is added from URL, RSS or RPC the category name
# is usually supplied by nzb-site or by application accessing
# NZBGet. Using Aliases you can match their categories with your owns.
#
# Separate aliases with commas or semicolons. Use wildcard-characters
# * and ? for pattern matching.
#
# Example: TV - HD, TV - SD, TV*
Category1.Aliases=

Category2.Name=Series
Category3.Name=Music
Category4.Name=Software


##############################################################################
### RSS FEEDS                                                              ###

# Name of RSS Feed.
#
# The name is used in UI and for logging. It can be any string.
#Feed1.Name=my feed

# Address (URL) of RSS Feed.
#
# Example: https://myindexer.com/api?apikey=3544646bfd1c535a9654645609800901&t=search&q=game.
#
# NOTE: When the feed is fetched for the very first time all existing
# items are ignored. The items found on subsequentional fetches are processed.
#Feed1.URL=

# Filter rules for items.
#
# Use filter to ignore unwanted items in the feed. In its simplest version
# the filter is a space separated list of words which must be present in
# the item title.
#
# Example: linux debian dvd.
#
# MORE INFO:
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/RSS.
#
# Feed filter consists of rules - one rule per line. Each rule defines
# a search string and a command, which must be performed if the search
# string matches. There are five kinds of rule-commands: Accept,
# Reject, Require, Options, Comment.
#
# NOTE: Since options in the configuration file can not span multiple
# lines, the lines (rules) must be separated with %-character (percent).
#
# Definition of a rule:
#  [A:|A(options):|R:|Q:|O(options):|#] search-string
#
#  A - declares Accept-rule. Rules are accept-rules by default, the
#      "A:" can be imitted. If the feed item matches to the rule the
#      item is considered good and no further rules are checked.
#  R - declares Reject-rule. If the feed item matches to the rule the
#      item is considered bad and no further rules are checked.
#  Q - declares Require-rule. If the feed item DOES NOT match to the rule
#      the item is considered bad and no further rules are checked.
#  O - declares Options-rule. If the feed item matches to the rule the
#      options declared in the rule are set for the item. The item is
#      neither accepted nor rejected via this rule but can be accepted
#      later by one of Accept-rules. In this case the item will have its
#      options already set (unless the Accept-rule overrides them).
#  # - lines starting with # are considered comments and are ignored. You
#      can use comments to explain complex rules or to temporary disable
#      rules for debugging.
#
# Options allow to set properties on nzb-file. It's a comma-separated
# list of property names with their values.
#
# Definition of an option:
#  name:value
#
# Options can be defined using long option names or short names:
#  category (cat, c)    - set category name, value is a string;
#  pause (p)            - add nzb in paused or unpaused state, possible
#                         values are: yes (y), no (n);
#  priority (pr, r)     - set priority, value is a signed integer number;
#  priority+ (pr+, r+)  - increase priority, value is a signed integer number;
#  dupescore (ds, s)    - set duplicate score, value is a signed integer number;
#  dupescore+ (ds+, s+) - increase duplicate score, value is a signed integer number;
#  dupekey (dk, k)      - set duplicate key, value is a string;
#  dupekey+ (dk+, k+)   - add to duplicate key, value is a string;
#  dupemode (dm, m)     - set duplicate check mode, possible values
#                         are: score (s), all (a), force (f);
#  rageid				- generate duplicate key using this rageid
#                         (integer number) and season/episode numbers;
#  series				- generate duplicate key using series identifier
#                         (any unique string) and season/episode numbers.
#
# Examples of option definitions:
#  Accept(category:my series, pause:yes, priority:100): my show 1080p;
#  Options(c:my series, p:y, r:100): 1080p;
#  Options(s:1000): 1080p;
#  Options(k+:1080p): 1080p;
#  Options(dupemode:force): BluRay.
#
# Rule-options override values set in feed-options.
#
# The search-string is similar to used in search engines. It consists of
# search terms separated with spaces. Every term is checked for a feed
# item and if they all succeed the rule is considered matching.
#
# Definition of a term:
#  [+|-][field:][command]param
#
#  +       - declares a positive term. Terms are positive by default,
#            the "+" can be omitted;
#  -       - declares a negative term. If the term succeed the feed
#            item is ignored;
#  field   - field to which apply the term. If not specified
#            the default field "title" is used;
#  command - a special character defining how to interpret the
#            parameter (followed after the command):
#            @  - search for string "param". This is default command,
#                 the "@" can be omitted;
#            $  - "param" defines a regular expression (using POSIX Extended
#                 Regular Expressions syntax);
#            =  - equal;
#            <  - less than;
#            <= - equal or less than;
#            >  - greater than;
#            >= - equal or greater than;
#  param   - parameter for command.
#
# Commands @ and $ are for use with text fields (title, filename, category,
# link, description, dupekey). Commands =, <, <=, > and >= are for use
# with numeric fields (size, age, imdbid, rageid, season, episode, priority,
# dupescore).
#
# Only fields title, filename and age are always present. The availability of
# other fields depend on rss feed provider.
#
# Any newznab attribute (encoded as "newznab:attr" in the RSS feed) can
# be used as search field with prefix "attr-", for example "attr-genre".
#
# Text search (Command @) supports supports wildcard characters * (matches
# any number of any characters), ? (matches any one character)
# and # (matches one digit).
# Text search is by default performed against words (word-search mode): the
# field content is separated into words and then each word is checked
# against pattern. If the search pattern starts and ends with * (star)
# the search is performed against the whole field content
# (substring-search mode). If the search pattern contains word separator
# characters (except * and ?) the search is performed on the whole
# field (the word-search would be obviously never successful in this
# case). Word separators are: !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~.
#
# Field "size" can have suffixes "K" or "KB" for kilobytes, "M" or "MB"
# for megabytes and "G" or "GB" for gigabytes. Field "age" can have
# suffixes "m" for minutes, "h" for hours and "d" for days. If suffix
# is not specified default is days.
#
# Examples (the trailing ; or . is not part of filter):
# 1) A: s01* -category:anime;
# 2) my show WEB-DL;
# 3) *my?show* WEB-DL size:<1.8GB age:>2h;
# 4) R: size:>9GB;
# 5) Q: HDTV.
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/RSS.
#Feed1.Filter=

# How often to check for new items (minutes).
#
# Value "0" disables the automatic check of this feed.
#Feed1.Interval=15

# Add nzb-files as paused (yes, no).
#Feed1.PauseNzb=no

# Category for added nzb-files.
#
# NOTE: Feed providers may include category name within response when nzb-file
# is downloaded. If you want to use the providers category leave the option empty.
#Feed1.Category=

# Priority for added nzb-files (number).
#
# Priority can be any integer value. The web-interface however operates
# with only six predefined priorities: -100 (very low priority), -50
# (low priority), 0 (normal priority, default), 50 (high priority),
# 100 (very high priority) and 900 (force priority). Downloads with
# priorities equal to or greater than 900 are downloaded and
# post-processed even if the program is in paused state (force mode).
#Feed1.Priority=0


##############################################################################
### INCOMING NZBS                                                          ###

# Create subdirectory with category-name in destination-directory (yes, no).
AppendCategoryDir=yes

# How often incoming-directory (option <NzbDir>) must be checked for new
# nzb-files (seconds).
#
# Value "0" disables the check.
#
# NOTE: nzb-files are processed by scan and queue scripts. See
# options <ScanScript> and <QueueScript>.
NzbDirInterval=5

# How old nzb-file should at least be for it to be loaded to queue (seconds).
#
# NZBGet checks if nzb-file was not modified in last few seconds, defined by
# this option. That safety interval prevents the loading of files, which
# were not yet completely saved to disk, for example if they are still being
# downloaded in web-browser.
NzbDirFileAge=60

# Check for duplicate titles (yes, no).
#
# If this option is enabled the program checks by adding of a new nzb-file:
# 1) if history contains the same title (see below) with success status
#    the nzb-file is not added to queue;
# 2) if download queue already contains the same title the nzb-file is
#    added to queue for backup (if firt file fails);
# 3) if nzb-file contains duplicate entries. This helps to find errors
#    in bad nzb-files.
#
# "Same title" means the nzb file name is same or the duplicate key is
# same. Duplicate keys are set by fetching from RSS feeds using title
# identifier fields provided by RSS provider (imdbid or rageid/season/episode).
#
# If duplicates were detected only one of them is downloaded. If download
# fails another duplicate is tried. If download succeeds all remaining
# duplicates are deleted from queue.
#
# NOTE: For automatic duplicate handling option <HealthCheck> must be
# set to "Delete" or "None". If it is set to "Pause" you will need to
# manually unpause another duplicate (if any exists in queue).
#
# NOTE: For more info on duplicates see http://nzbget.net/RSS.
DupeCheck=yes


##############################################################################
### DOWNLOAD QUEUE                                                         ###

# Save download queue to disk (yes, no).
#
# This allows to reload it on next start.
SaveQueue=yes

# Reload download queue on start, if it exists (yes, no).
ReloadQueue=yes

# Continue download of partially downloaded files (yes, no).
#
# If active the current state is saved after every article download and
# reloaded after restart. This is about files included in download jobs (usually
# rar-files), not about download-jobs (nzb-files) itself. Download-jobs are always
# continued regardless of that option.
#
# Disabling this option might slighlty reduce disk access and is
# therefore recommended on fast connections.
ContinuePartial=yes

# Propagation delay to your news servers (minutes).
#
# The option sets minimum post age for nzb-files. Very recent files
# are not downloaded to avoid download failures. The files remain
# on hold in the download queue until the propagation delay expires,
# after that they are downloaded.
PropagationDelay=0

# Decode articles (yes, no).
#
# yes - decode articles using internal decoder (supports yEnc and UU formats);
# no - the articles will not be decoded and joined. Useful for debugging to
#      look at article's source text.
Decode=yes

# Write decoded articles directly into destination output file (yes, no).
#
# Files are posted to Usenet in multiple pieces (articles). Each file typically
# requires hundreds of articles.
#
# When option <DirectWrite> is disabled, the program downloads all articles
# into temporary directory and then combines them into destination file.
#
# With this option enabled the program at first creates the output
# destination file with required size (total size of all articles),
# then writes on the fly decoded articles directly to the file
# without creating of any temporary files.
#
# This may improve performance but depends on OS and file system ability to
# instantly create large files without initializing them with nulls. Such
# files are called sparse files and are supported by modern file systems
# like EXT3 on Linux or NTFS on Windows.
#
# Using of this option reduces disk operations but may produce more fragmented
# files (depends on disk driver), which may slow down the unpack.
#
# NOTE: It's recommended to test how the option behave on your platform to find the
# best setting. For test try to download few big nzb-files (each 4GB or more)
# and measure the time used for download and unpack (use timestamps
# in the log-file to determine when the unpack was ended).
DirectWrite=yes

# Check CRC of downloaded and decoded articles (yes, no).
#
# Normally this option should be enabled for better detecting of download
# errors. However checking of CRC needs CPU time. On a fast connection and
# slow CPU disabling of CRC-Check may improve performance.
CrcCheck=yes

# How many retries should be attempted if a download error occurs (0-99).
#
# 1) If download fails because of "article or group not found error" the
# program tries another news server.
#
# 2) If download fails because of interrupted connection, the program
# tries the same server again until connection can be established.
#
# In both cases 1) and 2) option <Retries> is not used.
#
# If download however fails because of incomplete article, CRC-error or other
# error not mentioned above the program tries to redownload the article from
# the same news server as many times as defined in option <Retries>. If all
# attempts fail the program tries another news server.
Retries=3

# Set the interval between retries (seconds).
RetryInterval=10

# Set connection timeout (seconds).
ConnectionTimeout=60

# Timeout until a download-thread should be killed (seconds).
#
# This can help on hanging downloads, but is dangerous.
# Do not use small values!
TerminateTimeout=600

# Set the maximum download rate on program start (kilobytes/sec).
#
# The download rate can be changed later via remote calls.
#
# Value "0" means no speed control.
DownloadRate=0

# Accurate speed rate calculation (yes, no).
#
# During downloading using several connections the download threads may
# interfere with each other when updating statistical data for speed
# meter. This may cause small errors in current download speed reported
# by the program. The speed meter recovers automatically from such errors
# after max. 30 seconds (time window used for speed calculation).
#
# Enable the option to use thread synchronisation mechanisms in order to
# provide absolutely accurate speed calculations.
#
# NOTE: Thread synchronisation increases CPU load and therefore can
# decrease download speed. Do not activate this option on computers with
# limited CPU power. Before activating the option it is recommended to
# run tests to determine how the option affects the CPU usage and the
# download speed on a particular system.
AccurateRate=no

# Set the size of memory buffer used by writing the articles (bytes).
#
# Bigger values decrease disk-io, but increase memory usage.
# Value "0" causes an OS-dependent default value to be used.
# With value "-1" (which means "max/auto") the program sets the size of
# buffer according to the size of current article (typically less than 500K).
#
# NOTE: The value must be written in bytes, do not use postfixes "K" or "M".
#
# NOTE: To calculate the memory usage multiply WriteBufferSize by max number
# of connections, configured in section "NEWS-SERVERS".
#
# NOTE: Typical article's size not exceed 500000 bytes, so using bigger values
# (like several megabytes) will just waste memory.
#
# NOTE: For desktop computers with large amount of memory value "-1" (max/auto)
# is recommended, but for computers with very low memory (routers, NAS)
# value "0" (default OS-dependent size) could be better alternative.
#
# NOTE: Write-buffer is managed by OS (system libraries) and therefore
# the effect of the option is highly OS-dependent.
WriteBufferSize=0

# Pause if disk space gets below this value (megabytes).
#
# Disk space is checked for directories pointed by option <DestDir> and
# option <InterDir>.
#
# Value "0" disables the check.
DiskSpace=250

# Delete already downloaded files from disk when nzb-file is deleted
# (yes, no).
#
# This option defines if downloaded files must be deleted when:
# 1) download of nzb-file is cancelled (deleted from queue);
# 2) history record with failure-status (par-failure or unpack-failure)
# is deleted from history.
DeleteCleanupDisk=yes

# Delete source nzb-file when it is not needed anymore (yes, no).
#
# Enable this option for automatic deletion of source nzb-file from
# incoming directory when the program doesn't require it anymore (the
# nzb-file has been deleted from queue and history).
NzbCleanupDisk=yes

# Keep the history of downloaded nzb-files (days).
#
# After download and post-processing the items are added to history where
# their status can be checked and they can be post-processed again if
# neccessary.
#
# After expiring of defined period:
#
# If option <DupeCheck> is active the items become hidden and the amount
# of data kept is significantly reduced (for better performance), only
# fields necessary for duplicate check are kept. The item remain in the
# hidden history (forever);
#
# If option <DupeCheck> is NOT active the items are removed from history.
#
# Value "0" disables history. Duplicate check will not work.
KeepHistory=30

# Keep the history of outdated feed items (days).
#
# After fetching of an RSS feed the information about included items (nzb-files)
# is saved to disk. This allows to detect new items on next fetch. Feed
# providers update RSS feeds constantly. Since the feed length is limited
# (usually 100 items or less) the old items get pushed away by new
# ones. When an item is not present in the feed anymore it's not necessary
# to keep the information about this item on the disk.
#
# If option is set to "0", the outdated items are deleted from history
# immediately.
#
# Otherwise the items are held in the history for defined number of
# days. Keeping of items for few days helps in situations when feed provider
# has technical issues and may response with empty feeds (or with missing
# items). When the technical issue is fixed the items may reappear in the
# feed causing the program to redownload items if they were not found in
# the feed history.
FeedHistory=7

# Maximum number of simultaneous connections for nzb URL downloads (0-999).
#
# When NZB-files are added to queue via URL, the program downloads them
# from the specified URL. The option limits the maximal number of connections
# used for this purpose, when multiple URLs were added at the same time.
UrlConnections=4

# Force URL-downloads even if download queue is paused (yes, no).
#
# If option is active the URL-downloads (such as appending of nzb-files
# via URL or fetching of RSS feeds and nzb-files from feeds) are performed
# even if download is in paused state.
UrlForce=yes


##############################################################################
### LOGGING                                                                ###

# Create log file (yes, no).
CreateLog=yes

# Delete log file upon server start (only in server-mode) (yes, no).
ResetLog=no

# How error messages must be printed (screen, log, both, none).
ErrorTarget=both

# How warning messages must be printed (screen, log, both, none).
WarningTarget=both

# How info messages must be printed (screen, log, both, none).
InfoTarget=both

# How detail messages must be printed (screen, log, both, none).
DetailTarget=both

# How debug messages must be printed (screen, log, both, none).
#
# Debug-messages can be printed only if the program was compiled in
# debug-mode: "./configure --enable-debug".
DebugTarget=both

# Number of messages stored in buffer and available for remote
# clients (messages).
LogBufferSize=1000

# Create a log of all broken files (yes ,no).
#
# It is a text file placed near downloaded files, which contains
# the names of broken files.
CreateBrokenLog=yes

# Create memory dump (core-file) on abnormal termination, Linux only (yes, no).
#
# Core-files are very helpful for debugging.
#
# NOTE: Core-files may contain sensible data, like your login/password to
# newsserver etc.
DumpCore=no

# Local time correction (hours or minutes).
#
# The option allows to adjust timestamps when converting system time to
# local time and vice versa. The conversion is used when printing messages
# to the log-file and by option "TaskX.Time" in the scheduler settings.
#
# The option is usually not needed if the time zone is set up correctly.
# However, sometimes, especially when using a binary compiled on onother
# platform (cross-compiling) the conversion between system and local time
# may not work properly and requires adjustment.
#
# Values in the range -24..+24 are interpreted as hours, other values as minutes.
#  Example 1: set time correction to one hour: TimeCorrection=1;
#  Example 2: set time correction to one hour and a half: TimeCorrection=90.
TimeCorrection=0

# See also option <LogFile> in section "PATHS"


##############################################################################
### DISPLAY (TERMINAL)                                                     ###

# Set screen-outputmode (loggable, colored, curses).
#
# loggable - only messages will be printed to standard output;
# colored  - prints messages (with simple coloring for messages categories)
#            and download progress info; uses escape-sequences to move cursor;
# curses   - advanced interactive interface with the ability to edit
#            download queue and various output option.
OutputMode=curses

# Shows NZB-Filename in file list in curses-outputmode (yes, no).
#
# This option controls the initial state of curses-frontend,
# it can be switched on/off in run-time with Z-key.
CursesNzbName=yes

# Show files in groups (NZB-files) in queue list in curses-outputmode (yes, no).
#
# This option controls the initial state of curses-frontend,
# it can be switched on/off in run-time with G-key.
CursesGroup=no

# Show timestamps in message list in curses-outputmode (yes, no).
#
# This option controls the initial state of curses-frontend,
# it can be switched on/off in run-time with T-key.
CursesTime=no

# Update interval for Frontend-output in console mode or remote client
# mode (milliseconds).
#
# Min value 25. Bigger values reduce CPU usage (especially in curses-outputmode)
# and network traffic in remote-client mode.
UpdateInterval=200


##############################################################################
### SCHEDULER                                                              ###

# Time to execute the command (HH:MM).
#
# Multiple comma-separated values are accepted.
# Asterix as hours-part means "every hour".
#
# Examples: "08:00", "00:00,06:00,12:00,18:00", "*:00", "*:00,*:30".
#
# NOTE: Also see option <TimeCorrection>.
#Task1.Time=08:00

# Week days to execute the command (1-7).
#
# Comma separated list of week days numbers.
# 1 is Monday.
# Character '-' may be used to define ranges.
#
# Examples: "1-7", "1-5", "5,6", "1-5, 7".
#Task1.WeekDays=1-7

# Command to be executed ( PauseDownload, UnpauseDownload, PauseScan, UnpauseScan,
# DownloadRate, Script, Process, ActivateServer, DeactivateServer, FetchFeed).
#
# Possible commands:
#   PauseDownload    - pause download;
#   UnpauseDownload  - resume download;
#   PauseScan        - pause scan of incoming nzb-directory;
#   UnpauseScan      - resume scan of incoming nzb-directory;
#   DownloadRate     - set download rate limit;
#   Script           - execute one or multiple scheduler scripts. The scripts
#                      must be written specially for NZBGet;
#   Process          - execute an external (any) program;
#   ActivateServer   - activate news-server;
#   DeactivateServer - deactivate news-server;
#   FetchFeed        - fetch RSS feed.
#
# On start the program checks all tasks and determines current state
# for download-pause, scan-pause, download-rate and active servers.
#Task1.Command=PauseDownload

# Parameters for the command if needed.
#
# Some scheduler commands require additional parameters:
#  DownloadRate     - download rate limit to be set (kilobytes/sec).
#                     Example: 1000;
#  Script           - list of scheduler scripts to execute. The scripts in
#                     the list must be separated with commas or semicolons. Only
#                     filenames without path must be used. All scripts must be
#                     stored in directory pointed by option <ScriptDir>. For
#                     more info see below;
#  Process          - path to the program to execute and its parameters.
#                     Example: /home/user/fetch.sh.
#                     If filename or any parameter contains spaces it
#                     must be surrounded with single quotation
#                     marks. If filename/parameter contains single quotation marks,
#                     each of them must be replaced with two single quotation
#                     marks and the resulting filename/parameter must be
#                     surrounded with single quotation marks.
#                     Example: '/home/user/download/my scripts/task process.sh' 'world''s fun'.
#                     In this example one parameter (world's fun) is passed
#                     to the script (task process.sh).
#  ActivateServer   - comma separated list of news server ids or server names.
#                     Example: 1,3.
#                     Example: my news server 1, my news server 2.
#                     NOTE: server names should not have commas.
#  DeactivateServer - see ActivateServer.
#  FetchFeed        - comma separated list of RSS feed ids or feed names.
#                     Example: 1,3.
#                     Example: bookmarks feed, another feed.
#                     NOTE: feed names should not have commas.
#                     NOTE: use feed id "0" to fetch all feeds.
#
# INFO FOR DEVELOPERS:
# The rest of the description is for command "Script".
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
#
# NZBGet passes following arguments to scheduler script as environment
# variables:
#  NZBSP_TASKID    - id number of scheduler Task.
#
# In addition to these arguments NZBGet passes all nzbget.conf-options
# as environment variables. These variables have prefix "NZBOP_" and
# are written in UPPER CASE. For Example option "ParRepair" is passed as
# environment variable "NZBOP_PARREPAIR". The dots in option names are
# replaced with underscores, for example "SERVER1_HOST". For options
# with predefined possible values (yes/no, etc.) the values are passed
# always in lower case.
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
#Task1.Param=

#Task2.Time=20:00
#Task2.WeekDays=1-7
#Task2.Command=UnpauseDownload
#Task2.Param=


##############################################################################
### PAR CHECK/REPAIR                                                       ###

# Whether and how par-verification must be performed (auto, always, force, manual).
#
#  Auto   - par-check is performed when needed. One par2-file is always
#           downloaded. Additional par2-files are downloaded if needed
#           for repair. Repair is performed if the option <ParRepair>
#           is enabled;
#  Always - check every download (even undamaged). One par2-file is
#           always downloaded. Additional par2-files are downloaded
#           if needed for repair.  Repair is performed if the option
#           <ParRepair> is enabled;
#  Force  - force par-check for every download (even undamaged). All
#           par2-files are always downloaded. Repair is performed if
#           the option <ParRepair> is enabled;
#  Manual - par-check is skipped. One par2-file is always
#           downloaded. If a damaged download is detected, all
#           par2-files are downloaded but neithet par-check nor par-repair
#           take place. The download can be then repaired manually,
#           eventually on another faster computer.
ParCheck=auto

# Automatic par-repair after par-verification (yes, no).
#
# If option <ParCheck> is set to "Auto" or "Force" this option defines
# if the download must be repaired when needed. The option can be
# disabled if computer does not have enough CPU power, since repairing
# may take too much resources and time on a slow computers.
ParRepair=yes

# What files should be scanned during par-verification (auto, limited,
# full).
#
#  Limited - scan only files belonging to the par-set;
#  Full    - scan all files in the directory. This helps if the
#            files were renamed after creating of par-set;
#  Auto    - a limited scan is performed first. If the par-checker
#            detects missing files, it scans other files in the
#            directory until all required files are found.
#
# NOTE: For par-check/repair NZBGet uses library libpar2. The widely
# used version 0.2 of the library has few bugs, sometimes causing
# a crash of the program. This is especially true when using "full" or
# "auto" par-scan. NZBGet is supplied with patches addressing these
# issues. Please apply the patches to libpar2 and recompile it.
ParScan=auto

# Check for renamed and missing files (yes, no).
#
# Par-rename restores original file names using information stored
# in par2-files. It also detects missing files (files listed in
# par2-files but not present on disk). When enabled the par-rename is
# performed as the first step of post-processing for every nzb-file.
#
# Par-rename is very fast and is highly recommended, especially if
# unpack is disabled.
ParRename=yes

# Files to ignore when looking for missing files.
#
# List of file extensions or file names to ignore by par-rename. The
# entries must be separated with commas. The entries can be file
# extensions or any text the file name may end with.
#
# If par-rename detects missing files it will ignore files matching
# this option and will not initiate par-check/repair. This avoids
# time costing par-check/repair for unimportant files.
#
# NOTE: Files matching the option <ExtCleanupDisk> are ignored as well.
#
# Example: .sfv, .nzb, .nfo
ParIgnoreExt=.sfv, .nzb, .nfo

# What to do if download health drops below critical health (delete,
# pause, none).
#
#  Delete - delete nzb-file from queue. If option <DeleteCleanupDisk>
#           is active the already downloaded files will be deleted too;
#  Pause  - pause nzb-file;
#  None   - do nothing (continue download).
#
# NOTE: For automatic duplicate handling option must be set to "Delete"
# or "None". If it is set to "Pause" you will need to manually unpause
# another duplicate (if any exists in queue). See also option <DupeCheck>.
HealthCheck=delete

# Maximum allowed time for par-repair (minutes).
#
# If you use NZBGet on a very slow computer like NAS-device, it may be good to
# limit the time allowed for par-repair. NZBGet calculates the estimated time
# required for par-repair. If the estimated value exceeds the limit defined
# here, NZBGet cancels the repair.
#
# To avoid a false cancellation NZBGet compares the estimated time with
# <ParTimeLimit> after the first 5 minutes of repairing, when the calculated
# estimated time is more or less accurate. But in a case if <ParTimeLimit> is
# set to a value smaller than 5 minutes, the comparison is made after the first
# whole minute.
#
# Value "0" means unlimited.
#
# NOTE: The option limits only the time required for repairing. It doesn't
# affect the first stage of parcheck - verification of files. However the
# verification speed is constant, it doesn't depend on files integrity and
# therefore it is not necessary to limit the time needed for the first stage.
#
# NOTE: This option requires an extended version of libpar2 (the original
# version doesn't support the cancelling of repairing). Please refer to
# NZBGet's README for info on how to apply the patch to libpar2.
ParTimeLimit=0

# Pause download queue during check/repair (yes, no).
#
# Enable the option to give CPU more time for par-check/repair. That helps
# to speed up check/repair on slow CPUs with fast connection (e.g. NAS-devices).
#
# NOTE: If parchecker needs additional par-files it temporarily unpauses
# the queue.
#
# NOTE: See also options <ScriptPauseQueue> and <UnpackPauseQueue>.
ParPauseQueue=no

# Cleanup download queue after successful check/repair (yes, no).
#
# Enable this option for automatic deletion of unneeded (paused) par-files
# from download queue after successful check/repair.
ParCleanupQueue=yes

# Files to delete after successful check/repair.
#
# List of file extensions or file names to delete after successful
# download. The entries must be separated with commas. The entries
# can be file extensions or any text the file name may end with.
#
# Example: .par2, .sfv
ExtCleanupDisk=.par2, .sfv, _brokenlog.txt


##############################################################################
### UNPACK                                                                 ###

# Unpack downloaded nzb-files (yes, no).
#
# Each download (nzb-file) has a post-processing parameter "Unpack". The option
# <Unpack> is the default value assigned to this pp-parameter of the download
# when it is added to queue.
#
# When nzb-file is added to queue it can have a category assigned to it. In this
# case the option <CategoryX.Unpack> overrides the global option <Unpack>.
#
# If the download is damaged and could not be repaired using par-files
# the unpacking is not performed.
#
# If the option <ParCheck> is set to "Auto" the program tries to unpack
# downloaded files first. If the unpacking fails the par-check/repair
# is performed and the unpack is executed again.
Unpack=yes

# Pause download queue during unpack (yes, no).
#
# Enable the option to give CPU more time for unpacking. That helps
# to speed up unpacking on slow CPUs.
#
# NOTE: See also options <ParPauseQueue> and <ScriptPauseQueue>.
UnpackPauseQueue=no

# Delete archive files after successful unpacking (yes, no).
UnpackCleanupDisk=yes

# Full path to unrar executable.
#
# Example: /usr/bin/unrar.
#
# If unrar is in your PATH you may leave the path part and set only
# the executable name ("unrar" on POSIX or "unrar.exe" on Windows).
UnrarCmd=unrar

# Full path to 7-Zip executable.
#
# Example: /usr/bin/7z.
#
# If 7-Zip binary is in your PATH you may leave the path part and set only
# the executable name ("7z" or "7za" on POSIX or "7z.exe" on Windows).
SevenZipCmd=7z


##############################################################################
### EXTENSION SCRIPTS                                                      ###

# Default list of post-processing scripts to execute after the download
# of nzb-file is completed and possibly par-checked/repaired and unpacked.
#
# The scripts in the list must be separated with commas or semicolons. Only
# filenames without path must be used. All scripts must be stored in directory
# pointed by option <ScriptDir>.
#
# Example: Cleanup.sh, Move.sh, EMail.py.
#
# Each download (nzb-file) has its own list of post-processing scripts. The option
# <PostScript> is the default value assigned to download when it is added to
# queue. The list of post-processing scripts for a particular download can be
# changed in the edit dialog in web-interface or using remote command "--edit/-E".
#
# When nzb-file is added to queue it can have a category assigned to it. In this
# case the option <CategoryX.PostScript> (if not empty) overrides the
# global option <PostScript>.
#
# NOTE: The script execution order is controlled by option <ScriptOrder>, not
# by their order in option <PostScript>.
#
# NOTE: Changing options <PostScript> and <CategoryX.PostScript> doesn't affect
# already queued downloads.
#
# NOTE: For the list of interesting post-processing scripts see
# http://nzbget.net/Catalog_of_post-processing_scripts.
#
# INFO FOR DEVELOPERS:
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
#
# NZBGet passes following arguments to post-processing script as environment
# variables:
#  NZBPP_DIRECTORY    - path to destination dir for downloaded files;
#  NZBPP_NZBNAME      - user-friendly name of processed nzb-file as it is displayed
#                       by the program. The file path and extension are removed.
#                       If download was renamed, this parameter reflects the new name;
#  NZBPP_NZBFILENAME  - name of processed nzb-file. It includes file extension and also
#                       may include full path;
#  NZBPP_FINALDIR     - final destination path if set by one of previous pp-scripts;
#  NZBPP_CATEGORY     - category assigned to nzb-file (can be empty string);
#  NZBPP_TOTALSTATUS  - total status of nzb-file:
#                       SUCCESS - everything OK;
#                       WARNING - download is damaged but probably can
#                                 be repaired; user intervention is
#                                 required;
#                       FAILURE - download has failed or a serious error
#                                 occurred during post-processing (unpack, par);
#                       DELETED - download was deleted; post-processing
#                                 scripts are usually not called in this case;
#                                 however it's possible to force calling
#                                 scripts with command "post-process again";
#  NZBPP_STATUS       - complete status info for nzb-file: it consists
#                       of total status and status detail separated with
#                       slash, for example: "FAILURE/UNPACK"; for possible
#                       status details see documentation on web site;
#  NZBPP_SCRIPTSTATUS - summary status of the scripts executed before the
#                       current one:
#                       NONE - no other scripts were executed yet or all
#                              of them have ended with exit code "NONE";
#                       SUCCESS - all other scripts have ended with exit
#                                 code "SUCCESS" ;
#                       FAILURE - at least one of the script has failed;
#  NZBPP_HEALTH       - download health: an integer value in the range
#                       from 0 (all articles failed) to 1000 (all articles
#                       successfully downloaded);
#  NZBPP_CRITICALHEALTH - critical health for this nzb-file: an integer
#                       value in the range 0-1000. The critical health
#                       is calculated based on number and size of
#                       par-files. If nzb-file doesn't have any par-files
#                       the critical health is 1000 (100.0%). If a half
#                       of nzb-file were par-files its critical health
#                       would be 0. If NZBPP_HEALTH goes down below
#                       NZBPP_CRITICALHEALTH the download becomes unrepairable;
#  NZBPP_TOTALARTICLES - number of articles in nzb-file;
#  NZBPP_SUCCESSARTICLES - number of successfully downloaded articles;
#  NZBPP_FAILEDARTICLES - number of failed articles;
#  NZBPP_SERVERX_SUCCESSARTICLES - number of successfully downloaded
#                       articles from ServerX (X is replaced with server
#                       number, for example NZBPP_SERVER1_SUCCESSARTICLES);
#  NZBPP_SERVERX_FAILEDARTICLES - number of failed articles from ServerX.
#
# If the script defines own options they are also passed as environment
# variables. These variables have prefix "NZBPO_" in their names. For
# example, option "myoption" will be passed as environment variable
# "NZBPO_myoption" and in addition in uppercase as "NZBPO_MYOPTION".
#
# If the script defines own post-processing parameters, they are also passed as
# environment variables. These variables have prefix "NZBPR_" in their
# names. For example, pp-parameter "myparam" will be passed as environment
# variable "NZBPR_myparam" and in addition in uppercase as "NZBPR_MYPARAM".
#
# In addition to arguments, pp-options and pp-parameters NZBGet passes all
# nzbget.conf-options to pp-script as environment variables. These
# variables have prefix "NZBOP_" and are written in UPPER CASE. For Example
# option "ParRepair" is passed as environment variable "NZBOP_PARREPAIR". The
# dots in option names are replaced with underscores, for example
# "SERVER1_HOST". For options with predefined possible values (yes/no, etc.)
# the values are passed always in lower case.
#
# If the script moves files it can inform the program about new location
# by printing special message into standard output (which is processed
# by NZBGet):
#   echo "[NZB] DIRECTORY=/path/to/moved/files";
# or:
#   echo "[NZB] FINALDIR=/path/to/moved/files";
#
# Command "DIRECTORY" changes the destiantion path of the download and
# affects the scripts executed after the current script as well as the
# program code itself, for example the command "Post-process again"
# will work on new location. Command "FINALDIR" just sets a separate
# property of the download and should be used when the files are moved
# into an existing directory containg other files to avoid the processing
# of those files by other scripts.
#
# To assign post-processing parameters:
#   echo "[NZB] NZBPR_myvar=my value";
#
# The prefix "NZBPR_" will be removed. In this example a post-processing
# parameter with name "myvar" and value "my value" will be associated
# with nzb-file.
#
# Return value: NZBGet processes the exit code returned by the script:
#  93 - post-process successful (status = SUCCESS);
#  94 - post-process failed (status = FAILURE);
#  95 - post-process skipped (status = NONE). Use this code when you script
#       terminates immediateley without doing any job and when this is not
#       a failure termination;
#  92 - request NZBGet to do par-check/repair for current nzb-file.
#
# All other return codes are interpreted as failure (status = FAILURE).
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
PostScript=

# List of scan scripts to execute before a nzb-file is added to queue.
#
# The scripts in the list must be separated with commas or semicolons. Only
# filenames without path must be used. All scripts must be stored in directory
# pointed by option <ScriptDir>.
#
# The scripts are executed each time a new file is found in incoming
# directory (option <NzbDir>) or a file is received via RPC (web-interface,
# command "nzbget --append", etc.).
#
# Example: UnzipNzb.sh, ScanNotify.py.
#
# The scripts can unpack archives which were put in incoming directory, make
# filename cleanup, change nzb-name, category, priority and post-processing
# parameters of the nzb-file or do other things.
#
# INFO FOR DEVELOPERS:
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
#
# NZBGet passes following arguments to the script as environment
# variables:
#  NZBNP_DIRECTORY - path to directory, where file is located. It is a directory
#                    specified by the option <NzbDir> or a subdirectory;
#  NZBNP_FILENAME  - name of file to be processed;
#  NZBNP_NZBNAME   - nzb-name (without path but with extension);
#  NZBNP_CATEGORY  - category of nzb-file;
#  NZBNP_PRIORITY  - priority of nzb-file;
#  NZBNP_TOP  	   - flag indicating that the file will be added to the top
#                    of queue: 0 or 1;
#  NZBNP_PAUSED	   - flag indicating that the file will be added as
#                    paused: 0 or 1.
#
# In addition to these arguments NZBGet passes all nzbget.conf-options
# as environment variables. These variables have prefix "NZBOP_" and
# are written in UPPER CASE. For Example option "ParRepair" is passed as
# environment variable "NZBOP_PARREPAIR". The dots in option names are
# replaced with underscores, for example "SERVER1_HOST". For options
# with predefined possible values (yes/no, etc.) the values are passed
# always in lower case.
#
# The script can change nzb-name, category, priority,
# post-processing parameters and top-/paused-flags of the nzb-file
# by printing special messages into standard output (which is processed
# by NZBGet).
#
# To change nzb-name use following syntax:
#   echo "[NZB] NZBNAME=my download";
#
# To change category:
#   echo "[NZB] CATEGORY=my category";
#
# To change priority:
#   echo "[NZB] PRIORITY=signed_integer_value";
#
# for example: to set priority higher than normal:
#   echo "[NZB] PRIORITY=50";
#
# another example: use a negative value for "lower than normal" priority:
#   echo "[NZB] PRIORITY=-100";
#
# Although priority can be any integer value, the web-interface operates
# with six predefined priorities:
# -100 - very low priority;
# -50  - low priority;
# 0    - normal priority (default);
# 50   - high priority;
# 100  - very high priority;
# 900  - force priority.
#
# Downloads with priorities equal to or greater than 900 are downloaded and
# post-processed even if the program is in paused state (force mode).
#
# To assign post-processing parameters:
#   echo "[NZB] NZBPR_myvar=my value";
#
# The prefix "NZBPR_" will be removed. In this example a post-processing
# parameter with name "myvar" and value "my value" will be associated
# with nzb-file.
#
# To change top-flag (nzb-file will be added to the top of queue):
#   echo "[NZB] TOP=1";
#
# To change paused-flag (nzb-file will be added in paused state):
#   echo "[NZB] PAUSED=1";
#
# The script can delete processed file, rename it or move somewhere.
# After the calling of the script the file will be either added to queue
# (if it was an nzb-file) or renamed by adding the extension ".processed".
#
# NOTE: Files with extensions ".processed", ".queued" and ".error" are skipped
# during the directory scanning.
#
# NOTE: Files with extension ".nzb_processed" are not passed to
# scan-script before adding to queue. This feature allows scan-script
# to prevent the scanning of nzb-files extracted from archives, if
# they were already processed by the script.
#
# NOTE: Files added via RPC calls in particular from web-interface are
# saved into incoming nzb-directory and then processed by the script.
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
ScanScript=

# List of queue scripts to execute after a nzb-file is added to queue.
#
# The scripts in the list must be separated with commas or semicolons. Only
# filenames without path must be used. All scripts must be stored in directory
# pointed by option <ScriptDir>.
#
# The scripts are executed each time a new file is added to queue.
#
# Example: DeleteQueueSamples.sh, NzbAddedNotify.py.
#
# The script can modify the files in download queue (for example
# delete or pause all nfo, sfv, sample files) or do something else.
#
# INFO FOR DEVELOPERS:
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
#
# NZBGet passes following arguments to the queue script as environment
# variables:
#  NZBNA_NZBNAME  - name of nzb-group. This name can be used in calls
#                   to nzbget edit-command using subswitch "-GN name";
#  NZBNA_FILENAME - filename of the nzb-file. If the file was added
#                   from nzb-directory this is the fullname with path.
#                   If the file was added via web-interface it contains
#                   only filename without path;
#  NZBNA_EVENT    - describes why the script was called. Currently the
#                   queue scripts are called only after adding nzb-files
#                   to queue (NZBNA_EVENT=NZB_ADDED). In the future the
#                   list of supported events may be extended. The script
#                   MUST check that parameter to avoid conflicts with
#                   future NZBGet versions;
#  NZBNA_CATEGORY - category of nzb-file (if assigned);
#  NZBNA_NZBID    - id of the nzb-file. This ID can be used with
#                   calls to nzbget edit-command;
#  NZBNA_PRIORITY - priority (default is 0).
#
# In addition to these arguments NZBGet passes all nzbget.conf-options
# to  the script as environment variables. These variables have prefix
# "NZBOP_" and are written in UPPER CASE. For Example option "ParRepair"
# is passed as environment variable "NZBOP_PARREPAIR". The dots in option
# names are replaced with underscores, for example "SERVER1_HOST". For
# options with predefined possible values (yes/no, etc.) the values are
# passed always in lower case.
#
# Examples:
# 1) pausing nzb-file using file-id:
# "$NZBOP_APPBIN" -c "$NZBOP_CONFIGFILE" -E G P $NZBNA_NZBID;
# 2) setting category using nzb-name:
# "$NZBOP_APPBIN" -c "$NZBOP_CONFIGFILE" -E GN K "my cat" "$NZBNA_NZBNAME";
# 3) pausing files with extension "nzb":
# "$NZBOP_APPBIN" -c "$NZBOP_CONFIGFILE" -E FR P "$NZBNA_NZBNAME/.*\.nzb";
#
# NOTE: This is a short documentation, for more information visit
# http://nzbget.net/Extension_scripts.
QueueScript=

# Execution order for scripts.
#
# If you assign multiple scripts to one nzb-file, they are executed in the
# order defined by this option. Scripts not listed here are executed at
# the end in their alphabetical order.
#
# The scripts in the list must be separated with commas or semicolons. Only
# filenames without path must be used. All scripts must be stored in directory
# pointed by option <ScriptDir>.
#
# Example: Cleanup.sh, Move.sh.
ScriptOrder=

# Pause download queue during executing of postprocess-script (yes, no).
#
# Enable the option to give CPU more time for postprocess-script. That helps
# to speed up postprocess on slow CPUs with fast connection (e.g. NAS-devices).
#
# NOTE: See also options <ParPauseQueue> and <UnpackPauseQueue>.
ScriptPauseQueue=no
