Vagrant.require_version ">= 1.5"
def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
        }
    end
    return nil
end
Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
        v.name = "debian-downloader"
        v.customize [
            "modifyvm", :id,
            "--name", "debian-downloader",
            "--memory", 1024,
            "--natdnshostresolver1", "on",
            "--cpus", 1,
        ]
    end

    config.vm.box = "debian/jessie64"
    config.vm.network :private_network, ip: "192.168.33.100"
    config.ssh.forward_agent = true

    if which('ansible-playbook')
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
        end
    else
        config.vm.provision :shell, path: "ansible/windows.sh", args: ["debian-downloader"]
    end

    config.vm.synced_folder "./", "/vagrant", type: "nfs"
end
