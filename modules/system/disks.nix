{ ... }: {

   fileSystems."/mnt/makima" =
    { device = "/dev/disk/by-uuid/E6FB-AEB8";
      fsType = "exfat";
      options = ["nofail" "uid=1000" "gid=1000" "dmask=007" "fmask=117"];
    };

  fileSystems."/mnt/reze" =
    { 
      device = "/dev/disk/by-uuid/1b5857f8-5912-4229-9939-c265d0bc332c";
      fsType = "ext4";
      options = ["nofail" "rw" "user" "exec"];#["nofail" "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
    };

  fileSystems."/mnt/asa" = 
    {
     device= "/dev/disk/by-uuid/4cd22232-9f91-4f7c-a878-3a4c386f39e5";
     fsType = "ext4";
     options = ["nofail" "rw" "user" "exec"];#[ "nofail" "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
    };
}
