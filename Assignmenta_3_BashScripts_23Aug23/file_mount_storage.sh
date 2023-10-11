
Option 1 Assignment 3
# Check if a script argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [mount_point_or_file_system]"
  exit 1
fi

# Store the mount point or file system name
MOUNT_POINT="$1"

# Use the `df` command to get disk usage information
# and `grep` to filter out the specific mount point or file system
MOUNT_INFO=$(df --output=source,pcent,avail | grep "$MOUNT_POINT")

# Check if the mount point or file system is mounted
if [ -z "$MOUNT_INFO" ]; then
  echo "Error: The mount point or file system '$MOUNT_POINT' is not mounted."
  exit 2
else
  # Extract and display used space and free space
  USED_SPACE=$(echo "$MOUNT_INFO" | awk '{print $2}')
  FREE_SPACE=$(echo "$MOUNT_INFO" | awk '{print $3}')
  
  echo "The mount point or file system '$MOUNT_POINT' is mounted."
  echo "Used Space: $USED_SPACE"
  echo "Free Space: ${FREE_SPACE}K" # The free space is shown in kilobytes by default
fi

option2 Assignment 3
Check if the number of arguments provided is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <mount_point_or_file_system>"
    exit 1
fi

# Assign the provided argument to a variable for clarity
MOUNT_POINT_OR_FILE_SYSTEM="$1"

# Use the `mountpoint` command to check if the given path is a mount point
mountpoint -q "$MOUNT_POINT_OR_FILE_SYSTEM"
if [ $? -eq 0 ]; then
    # Use `df` command to fetch disk usage statistics for the given mount point or file system
    OUTPUT=$(df --output=used,avail "$MOUNT_POINT_OR_FILE_SYSTEM" | tail -n 1)
    USED_SPACE=$(echo $OUTPUT | awk '{print $1}')
    FREE_SPACE=$(echo $OUTPUT | awk '{print $2}')

    echo "Mount point or file system '$MOUNT_POINT_OR_FILE_SYSTEM' is mounted."
    echo "Used Space: $USED_SPACE KB"
    echo "Free Space: $FREE_SPACE KB"
else
    echo "Error: Mount point or file system '$MOUNT_POINT_OR_FILE_SYSTEM' is not mounted."
    exit 2
fi