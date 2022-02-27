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

struct ControlVars {
	u32 P;
	u32 I;
	u32 D;
	padding[3];
	u16 reset_time;
	u32 hysterisis;
};

struct FanMode {
	ControlType control_type;
	u32 control_value;
	padding[2];
	u8 src;
	padding[4];
	ControlVars control_vars;
};

u8 aquabus_address @ 0x4f;

u32 flow_sensor_type @ 0x54;
u32 sensor_offsets[4] @0x5c;

FanSetup fan0_setup @ 0x6d [[color("FF00FF")]];
FanSetup fan1_setup @ 0x7f [[color("0000FF")]];
FanSetup fan2_setup @ 0x91 [[color("00FF00")]];
FanSetup fan3_setup @ 0xa3 [[color("00FFFF")]];

FanMode fan0_mode @ 0xb5 [[color("FF00FF")]];
FanMode fan1_mode @ 0x15f [[color("0000FF")]];
FanMode fan2_mode @ 0x209 [[color("00FF00")]];
FanMode fan3_mode @ 0x2b3 [[color("00FFFF")]];

u32 checksum @ 0x7c6 [[color("FF0000")]];
