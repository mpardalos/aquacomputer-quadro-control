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

StartBoost fan0_start_boost @ 0x6d;
StartBoost fan1_start_boost @ 0x7f;
FanMode fan0_mode @ 0xb5;
FanMode fan1_mode @ 0x15f;

