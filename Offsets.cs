namespace AotForms
{
    internal static class Offsets
    {
        internal static ulong Il2CppBase;
        internal static uint InitBase = 0x9EC1C48;

        internal static class Match
        {
            internal static uint StaticClass = 0x5C;
            internal static uint Current = 0x50;
            internal static uint Status = 0x8C;
            internal static uint LocalPlayer = 0x94;
            internal static uint EntitiesDictionary = 0x68;

            internal static uint LocalObserver = 0xB4;
            internal static uint LocalSpectator = 0xB8;
            internal static uint TargetPlayer = 0x28;
            internal static uint TargetSpectatorPlayer = 0x58;
        }

        internal static class Player
        {
            internal static uint ShadowBase = 0x16BC;
            internal static uint IsDead = 0x50;
            internal static uint Name = 0x2E4;
            internal static uint Data = 0x48;
            internal static uint IsKnocked = 0x78;
            internal static uint TransformType = 0xC1C;

            internal static uint Level = 0x1350;
            internal static uint IsBot = 0x244;

            internal static uint HeadCollider = 0x4A8;
            internal static uint TargetHead = 0x54;

            internal static uint IsFiring = 0x544;
        }

        internal static class Avatar
        {
            internal static uint Manager = 0x4C4;
            internal static uint Instance = 0xA0;
            internal static uint IsVisible = 0x95;
            internal static uint Data = 0x14;
            internal static uint IsTeammate = 0x59;
        }

        internal static class Camera
        {
            internal static uint Follow = 0x454;
            internal static uint Main = 0x18;
            internal static uint AimRotation = 0x404;
            internal static uint Transform = 0x254;
            internal static uint ViewMatrix = 0xE8;
        }

        internal static class Weapon
        {
            internal static uint Current = 0x3F8;
            internal static uint Data = 0x58;
            internal static uint Recoil = 0xC;
        }
    }

    internal enum Bone : uint
    {
        WeaponMount = 0x458,
        Head = 0x45C,
        Hip = 0x460,
        BloodEffect = 0x464,
        Skateboard = 0x468,
        Flight = 0x46C,
        Root = 0x470,
        BoneRoot = 0x474,
        LeftAnkle = 0x478,
        RightAnkle = 0x47C,
        LeftToe = 0x480,
        RightToe = 0x484,
        LeftWeapon = 0x488,
        LeftArm = 0x490,
        RightArm = 0x494,
        RightHand = 0x498,
        LeftHand = 0x49C,
        RightForeArm = 0x4A0,
        LeftForeArm = 0x4A4
    }
}
