enum ReportType : u8 {
	SENSORS = 0x8,
	FANS = 0x3,
};

ReportType report_type @ 0x31;

enum StartBoost : u8 {
	ON = 0x02,
	OFF = 0x00
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

StartBoost fan0_start_boost @ 0x6d;
StartBoost fan1_start_boost @ 0x7f;

FanMode fan0_mode @ 0xb5;
FanMode fan1_mode @ 0x15f;

ControlVars fan0_ctrl @ 0xc1;
