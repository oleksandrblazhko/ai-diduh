VBoxManage createmedium --filename d:/VM-Virtual-Box/DiskDidukh2.vdi --size 8920
VBoxManage createvm --name "Ubuntu for Didukh 2" --ostype Ubuntu14_LTS --register
VBoxManage modifyvm "Ubuntu for Didukh 2" --memory 2235
VBoxManage modifyvm "Ubuntu for Didukh 2" --cpus 1
VBoxManage modifyvm "Ubuntu for Didukh 2" --vram 123
VBoxManage modifyvm "Ubuntu for Didukh 2" --nic1 nat
VBoxManage modifyvm "Ubuntu for Didukh 2" --natpf1 "SSH, tcp, 127.0.0.1,1234,10.0.2.15,22"
VBoxManage storagectl "Ubuntu for Didukh 2" --name "DidukhSATA" --add sata --controller IntelAHCI
VBoxManage storagectl "Ubuntu for Didukh 2" --name "DidukhIDE" --add ide --controller PIIX4
VBoxManage createmedium --filename d:/VM-Virtual-Box/DiskDidukh2.vdi --size 8920
VBoxManage storageattach "Ubuntu for Didukh 2" --storagectl "DidukhSATA" --port 0 --device 0 --type hdd --medium d:/VM-Virtual-Box/DiskDidukh2.vdi
VBoxManage storageattach "Ubuntu for Didukh 2" --storagectl "DidukhIDE" --port 0 --device 0 --type dvddrive --medium d:/Install/ubuntu-14.04.6-server-amd64.iso
VBoxManage startvm "Ubuntu for Didukh 2" --type headless
VBoxManage controlvm "Ubuntu for Didukh 2" savestate
VBoxManage startvm "Ubuntu for Didukh 2" --type headless
VBoxManage controlvm "Ubuntu for Didukh 2" poweroff
VBoxManage unregistervm "Ubuntu for Didukh 2" --delete-all


