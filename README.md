# startITunes
Creates and plays a playlist sorted by album and oldest time played

Command line arguments

playlist    - The name of the playlist

netDrive    - A server containing the iTunes files.  This is passed to the 
              "mount volume" command.

musicPath   - The full path to the iTunes folder

noplay      - Flag - Don't start playing now

start       - Bytes to skip before adding file to playlist

size        - Size in bytes of the playlist to create

pod         - Don't include album that played last in search

podcasts    - Flag - Only include podcasts

noclear     - Flag - Don't clear out the playlist before adding files

again       - Flag - If not set then quit if iTunes ran recently 

