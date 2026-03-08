class fifo_test extends uvm_test;
    `uvm_component_utils (fifo_test)

    function new (string name = "fifo_test", uvm_component parent = null);
        super.new (name, parent);
    endfunction

    fifo_env m_env;


    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        
        m_env = fifo_env::type_id::create ("fifo_env", this);
    endfunction

virtual task run_phase (uvm_phase phase);
  
  	//phase.raise_objection(this);
    
  	fifo_wr_seq wr_seq;
    fifo_rd_seq rd_seq;
    
    wr_seq = fifo_wr_seq::type_id::create("wr_seq");
    rd_seq = fifo_rd_seq::type_id::create("rd_seq");
    
    phase.raise_objection(this);
    
    wr_seq.start(m_env.m_agent.seqr);  // write 10번
    rd_seq.start(m_env.m_agent.seqr);  // read 10번
    
    phase.drop_objection(this);
endtask

  


endclass