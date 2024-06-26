`ifndef TONIC_PARAMS_V
`define TONIC_PARAMS_V

`include "bsg_defines.v"
// Simulation parameters
`define     TONIC_INIT_RTX_TIMER_AMNT   2000
`define     TONIC_INIT_WND_SIZE         10
`define     LOSS_PROB                   300
`define     SEND_DD_CONTEXT             0
`define     CR_TYPE                     0
`define     SIM_CYCLES                  100
`define     RTT                         20
`define     RECEIVER                    True
`define     INIT_USER_CONTEXT           0
`define     DEBUG

// CR_TYPE
`define     CR_TYPE_CWND            0
`define     CR_TYPE_RATE            1
`define     CR_TYPE_GRANT           2

// Cross-Engine Context
`define     DD_CONTEXT_W            (`RATE_W)
`define     DD_CONTEXT_NONE         {`DD_CONTEXT_W{1'b1}}
`define     CR_CONTEXT_W            1

//FLOW
`define     FLOW_ID_W               `MAX_FLOW_CNT_WIDTH

`define     FLOW_SEQ_NUM_W          32  // should be power of two
`define     FLOW_SEQ_NONE           {`FLOW_SEQ_NUM_W{1'h1}}
`define     FLOW_ID_NONE            {`FLOW_ID_W{1'b1}}

`define     MAX_FLOW_CNT            8// should be power of two
`define     MAX_FLOW_CNT_WIDTH      (`BSG_SAFE_CLOG2(`MAX_FLOW_CNT))
`define     ACTIVE_FLOW_CNT         `MAX_FLOW_CNT

// WINDOW
`define     FLOW_WIN_SIZE           9'd128
`define     MAX_FLOW_WIN_SIZE       8'd120
`define     FLOW_WIN_SIZE_W         (`BSG_SAFE_CLOG2(`FLOW_WIN_SIZE+8'd1) + 8'd1)
`define     FLOW_WIN_IND_W          `FLOW_WIN_SIZE_W
`define     FLOW_WIN_MOD            {`FLOW_WIN_SIZE_W{1'b1}}


// Packet Queues

`define     MAX_PKT_QUEUE_SIZE      16  // should be power of two 
`define     MAX_QUEUE_BITS          (`MAX_PKT_QUEUE_SIZE * `FLOW_SEQ_NUM_W)
`define     MAX_TX_ID_BITS          (`MAX_PKT_QUEUE_SIZE * `TX_CNT_W)
`define     PKT_QUEUE_IND_W         (`BSG_SAFE_CLOG2(`MAX_PKT_QUEUE_SIZE))
`define     PKT_QUEUE_START_THRESH  (`MAX_PKT_QUEUE_SIZE - 6)
`define     PKT_QUEUE_STOP_THRESH   (`MAX_PKT_QUEUE_SIZE - 5)

// Timers
`define     TIMER_W                 32
`define     CRED_TIMER_W            32

// Time
`define     TX_SIZE_W               11


// Time, Rate, and Credit

`define     TIME_W                  32

`define     RATE_W                  18
`define     BASE_RATE               1562500
`define     LOW_RATE_THRESH         215
`define     MAX_RATE                (100000000000 / `BASE_RATE)

`define     CYC_1_START_IND         `RATE_W - 1
`define     CYC_1_END_IND           `RATE_W - 9 

`define     CYC_8_START_IND         `CYC_1_END_IND - 1
`define     CYC_8_END_IND           `CYC_1_END_IND - 3

`define     CYC_64_START_IND        `CYC_8_END_IND - 1
`define     CYC_64_END_IND          `CYC_8_END_IND - 3

`define     CYC_512_START_IND       `CYC_64_END_IND - 1
`define     CYC_512_END_IND         `CYC_64_END_IND - 3

`define     CRED_W                  32

// Credit Cap

`define     CRED_CAP                {`CRED_W{1'b1}}


// Pkt Types and Data

`define     PKT_TYPE_W              4
`define     PKT_DATA_W              100

`define     SACK_PKT                {`PKT_TYPE_W{1'b0}}
`define     PULL_PKT                {{(`PKT_TYPE_W-1){1'b0}}, 1'd1}
`define     NACK_PKT                {{(`PKT_TYPE_W-2){1'b0}}, 2'd2}
`define     CACK_PKT                {{(`PKT_TYPE_W-2){1'b0}}, 2'd3}
`define     CNP_PKT                 {{(`PKT_TYPE_W-1){1'b0}}, 3'd4}
`define     NONE_PKT                {`PKT_TYPE_W{1'b1}}

// Grants

`define     SEND_CNTR_W             `FLOW_SEQ_NUM_W
`define     PULL_CNTR_W             `SEND_CNTR_W
`define     REM_PULL_PKT_W          16
`define     MAX_REM_PULL_PKT_CNT    {`REM_PULL_PKT_W{1'b1}}


// TX_CNT

`define     TX_CNT_W                2
`define     MAX_TX_CNT              {`TX_CNT_W{1'b1}}
`define     TX_CNT_WIN_SIZE         (`FLOW_WIN_SIZE * `TX_CNT_W)

// Other
`define     FLAG_W                  1

// OUTQ
`define     OUTQ_W                  (`FLOW_ID_W + `FLOW_SEQ_NUM_W + `TX_CNT_W) 
`define     OUTQ_MAX_SIZE           16 //power of two
`define     OUTQ_SIZE_W             (`BSG_SAFE_CLOG2(`OUTQ_MAX_SIZE))
`define     OUTQ_THRESH             10


`define     DD_CONTEXT_1_W          `FLOW_WIN_SIZE_W  + `FLOW_WIN_SIZE  + \
                                    `TX_CNT_WIN_SIZE  + `FLOW_WIN_IND_W + \
                                    `FLOW_SEQ_NUM_W   + `FLOW_SEQ_NUM_W  \

`define     DD_FIXED_CONTEXT_2_W    `FLOW_SEQ_NUM_W   +                   \
                                    `TIME_W           + `FLAG_W +         \
                                    `PKT_QUEUE_IND_W  + `FLAG_W +         \
                                    `FLAG_W           + `FLOW_WIN_SIZE +  \
                                    `TIMER_W                              \

`define     DD_CONTEXT_2_W          `DD_FIXED_CONTEXT_2_W + `USER_CONTEXT_W

`define     CR_CONTEXT_1_W          `MAX_QUEUE_BITS + `MAX_TX_ID_BITS +   \
                                      3 * `PKT_QUEUE_IND_W + `FLAG_W 

`define USER_CONTEXT_W      (`FLAG_W + 3 * `FLOW_WIN_SIZE_W)

`define DUP_ACKS_THRESH     {{(`FLOW_WIN_SIZE_W-2){1'b0}}, 2'd3}
`define MAX_DUP_ACKS        {{(`FLOW_WIN_SIZE_W-4){1'b0}}, 4'd10}
`endif
