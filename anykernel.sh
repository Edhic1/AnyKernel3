### AnyKernel3 Setup
properties() { '
kernel.string=CustomKernel by Edhic1 @ xda-developers
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lancelot
device.name2=galahad
supported.versions=11
'; }

### Install
BLOCK=/dev/block/platform/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=gz;

. tools/ak3-core.sh;
dump_boot;

# Example lancelot-specific patches
backup_file init.rc;
replace_string init.rc "cpuctl cpu,timer_slack" "mount cgroup none /dev/cpuctl cpu";

backup_file fstab.mt6768;
patch_fstab fstab.mt6768 /data ext4 options "data=ordered" "data=writeback";

write_boot;
