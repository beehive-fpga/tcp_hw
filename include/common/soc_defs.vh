`ifndef SOC_DEFINES
`define SOC_DEFINES
`include "packet_defs.vh"
    
`define MAC_INTERFACE_W 512
`define MAC_INTERFACE_BITS_W ($clog2(`MAC_INTERFACE_W))
`define MAC_INTERFACE_BYTES (`MAC_INTERFACE_W/8)
`define MAC_INTERFACE_BYTES_W ($clog2(`MAC_INTERFACE_BYTES))
`define MAC_PADBYTES_W ($clog2(`MAC_INTERFACE_BYTES))
`define MAC_NUM_ELS (`MTU_SIZE/`MAC_INTERFACE_BYTES)
`define MAC_NUM_ELS_W ($clog2(`MAC_NUM_ELS))


`define MEM_ADDR_W 12
`define MEM_DATA_W 512
`define MEM_BURST_CNT_W 7
`define MEM_WR_MASK_W (`MEM_DATA_W/8)

`define PKT_TIMESTAMP_W 64

`endif
