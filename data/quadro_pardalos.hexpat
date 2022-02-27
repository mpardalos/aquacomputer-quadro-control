enum ReportType : u8 {
	SENSORS = 0x8,
	FANS = 0x3,
};

ReportType report_type @ 0x31;

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
	u8 control_value[4];
};

struct ControlVars {
	u32 P;
	u32 I;
	u32 D;
	padding[3];
	u16 reset_time;
	u32 hysterisis;
};

FanSetup fan0_setup @ 0x6d;
FanSetup fan1_setup @ 0x7f;
FanSetup fan2_setup @ 0x91;
FanSetup fan3_setup @ 0xa3;

FanMode fan0_mode @ 0xb5;
FanMode fan1_mode @ 0x15f;

ControlVars fan0_ctrl @ 0xc1;
ControlVars fan1_ctrl @ 0x16c;

u32 checksum @ 0x7c6;
