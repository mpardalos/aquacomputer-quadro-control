struct fan_point {
	u8 start_boost_hold_minimal;
	u16 min;
	u16 max;
	u16 fallback_pwm;
	u16 graph_rpm;
};

struct fan {
	fan_point points[4];
	u16 fallback_pwm;
};

fan fan1 @ 0x0052;
u16 fan2_pwm @ 0xcc;
u16 fan3_pwm @ 0x0121;

u8 aquabus_address @ 0x43;
u16 flow_ticks @ 0x46;
u16 flow_correction @ 0x48;

u16 sensor1_offset @ 0x4a;
u16 sensor2_offset @ 0x4c;
u16 sensor3_offset @ 0x4d;
u16 sensor4_offset @ 0x50;

u8 profile @ 0x3fd;

u16 checksum @ 0x3ff;

u32 fan4_percent @ 0x2b4;


