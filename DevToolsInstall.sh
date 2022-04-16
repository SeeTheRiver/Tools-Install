
echo "This script will install the DevTools for you. These tools include: Python 3.10.3, pip, java openjdk-11, android studio, dotnet core 6 and VS Code";
echo "Do you want to continue? (y/n)";
read answer;
while [ "$answer" != "y" ] && [ "$answer" != "n" ]; do
    echo "Please enter y or n";
    read answer;
done
if [ "$answer" = "y" ]; then
    echo "Installing DevTools...";
    if [ -x "$(command -v apt-get)" ]; then 
    sudo apt update;
    sudo apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev;
    wget https://www.python.org/ftp/python/3.10.3/Python-3.10.3.tgz;
    tar -xf Python-3.10.*.tgz;
    cd Python-3.10.*/;
    ./configure --enable-optimizations;
    make -j $(nproc);
    sudo make altinstall;
    python3.10 --version;
    sudo apt -y install python3-pip;
    sudo apt -y install openjdk-11-jdk;
    sudo add-apt-repository -y ppa:maarten-fonville/android-studio;
    sudo apt update;
    sudo apt -y install android-studio;
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb;
    sudo dpkg -i packages-microsoft-prod.deb;
    rm packages-microsoft-prod.deb;
    sudo apt-get update; 
    sudo apt-get install -y apt-transport-https 
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-6.0
    sudo apt-get -y install wget gpg;
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/;
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list';
    rm -f packages.microsoft.gpg;
    sudo apt -y install apt-transport-https;
    sudo apt update;
    sudo apt -y install code;
    elif [ -x "$(command -v dnf)" ];     then 
    sudo dnf install -y wget yum-utils make gcc openssl-devel bzip2-devel libffi-devel zlib-devel;
    wget https://www.python.org/ftp/python/3.10.3/Python-3.10.3.tgz;
    tar xzf Python-3.10.3.tgz;
    cd Python-3.10.3;
    sudo ./configure --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions;
    sudo make -j ${nproc};
    sudo make altinstall;
    sudo rm Python-3.10.3.tgz 
    python3.10 -V ;
    pip3.10 -V;
    sudo dnf install -y openjdk-11-jdk
    sudo dnf install -y qemu-kvm bridge-utils libvirt virt-install;
    sudo dnf install -y snapd;
    sudo ln -s /var/lib/snapd/snap /snap;
    sudo snap install -y core && sudo snap refresh core;
    sudo snap install -y android-studio --classic
    sudo dnf -y install dotnet-sdk-6.0;
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';
    dnf check-update
    sudo dnf -y install code
    else echo "FAILED TO INSTALL Development tools, make sure your are either using apt(ubuntu) or dnf(fedora) as a package manager">&2; 
    fi
elif [ "$answer" = "n" ]; then
    echo "DevTools installation cancelled.";
fi





