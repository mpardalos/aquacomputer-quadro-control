enum ReportType : u8 {
	SENSORS = 0x8,
	FANS = 0x3,
};

ReportType report_type @ 0x31 [[color("FF0000")]];

bitfield FanFlags {
	hold_minimum_power : 1;
	start_boost : 1;
};

struct FanSetup {
	FanFlags flags;
	u32 min_power;
	u32 max_power;
	u32 fallback_power;
	u32 graph_max;
};


enum ControlType : u8 {
	CONST = 0x00,
	TARGETTEMP = 0x01,
};

struct FanMode {
	ControlType control_type;
	u32 control_value;
};

struct ControlVars {
	u32 P;
	u32 I;
	u32 D;
	padding[3];
	u16 reset_time;
	u32 hysterisis;
};

FanSetup fan0_setup @ 0x6d [[color("FF00FF")]];
FanSetup fan1_setup @ 0x7f [[color("0000FF")]];
FanSetup fan2_setup @ 0x91 [[color("00FF00")]];
FanSetup fan3_setup @ 0xa3 [[color("00FFFF")]];

FanMode fan0_mode @ 0xb5 [[color("FF00FF")]];
ControlVars fan0_ctrl @ 0xc1 [[color("FF00FF")]];

FanMode fan1_mode @ 0x15f [[color("0000FF")]];
ControlVars fan1_ctrl @ 0x16c [[color("0000FF")]];

u32 checksum @ 0x7c6 [[color("FF0000")]];
