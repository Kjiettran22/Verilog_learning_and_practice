############################
# 1. CLOCK CONSTRAINT
############################

# Tạo clock 100 MHz (chu kỳ 10 ns)
create_clock -name sys_clk -period 10.000 [get_ports clk]

############################
# 2. RESET (không cần timing)
############################

# Reset thường không cần timing constraint
# Chỉ cần set false path để tránh báo lỗi timing
set_false_path -from [get_ports rst_n]

############################
# 3. INPUT / OUTPUT DELAY (cơ bản)
############################

# Giả sử input data đi cùng clock
set_input_delay  -clock sys_clk 2.000 [get_ports {data_in[*]}]
set_output_delay -clock sys_clk 2.000 [get_ports {data_out[*]}]

############################
# 4. ASYNC SIGNALS (nếu có)
############################

# Nếu có tín hiệu async (button, switch)
# thì cắt timing
#set_false_path -from [get_ports btn]

############################
# 5. MULTI-CLOCK (nếu có)
############################

# Nếu có 2 clock không liên quan
# set_clock_groups -asynchronous -group {clk1} -group {clk2}
