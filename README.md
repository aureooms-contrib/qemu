
See https://wiki.archlinux.org/index.php/QEMU.

Create a 50G image

	qemu-img create -f qcow2 drive.cow 50G


Grab info on image

	qemu-img info './drive.cow'


Boot arch-anywhere with some blank disk, 4G of memory, kvm enabled
Internet will not be available, see next example for making internet available

	qemu-system-x86_64 -enable-kvm -cdrom iso/arch-anywhere-2.2.2-dual.iso -boot order=d -drive file=/vm-ct/hdd/drive.cow,format=qcow2 -m 4G


Create image drive-XX:XX:XX:XX:XX:XX.cow then boot iso with random MAC address
XX:XX:XX:XX:XX:XX and mounting USB device bus 3 addr 7. The USB stick should
contain some script to connect to ULB internet that you can use for the
installation

	qemu-create iso/arch-anywhere-2.2.2-dual.iso /vm-ct/hdd/drive.cow 50G 4G 3 7


If the filename ends with a MAC address, you can virtualize it using a custom
script that will use this MAC address for the virtual network card of the
virtual machine.

Start existing install

	qemu-start /vm-ct/hdd/drive-54:52:C0:16:AF:00.cow -cpu host -m 4G


Start with usb bus 3 device 6

	qemu-start /vm-ct/hdd/drive-54:52:C0:16:AF:00.cow -usb -device usb-host,hostbus=3,hostaddr=6 -cpu host -m 4G
