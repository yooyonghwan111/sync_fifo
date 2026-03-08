class fifo_wr_seq extends uvm_sequence #(fifo_seq_item);
  
  `uvm_object_utils (fifo_wr_seq)
  
  function new (string name = "fifo_wr_seq");
    super.new (name);
  endfunction
  
  task body();
    
    integer i ;
    
    fifo_seq_item item;
    
    //uvm_do(item) //disable constraint   
    for(i=0; i<10; i++) begin
      	`uvm_do_with (item, {item.wr_en==1; item.rd_en == 0;})
    end

  endtask
  
endclass

class fifo_rd_seq extends uvm_sequence #(fifo_seq_item);
  
  `uvm_object_utils (fifo_rd_seq)
  
  function new (string name = "fifo_rd_seq");
    super.new (name);
  endfunction
  
  task body();
    
    integer i ;
    
    fifo_seq_item item;
    //'uvm_do(item) //disable constraint
    
    
    for(i=0; i<10; i++) begin
      `uvm_do_with (item, {item.wr_en==0; item.rd_en == 1;})
    end

  endtask
  
endclass