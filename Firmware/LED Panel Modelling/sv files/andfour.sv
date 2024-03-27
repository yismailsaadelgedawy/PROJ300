module andfour (

    output logic q,

    input logic a,b,c,d

);


always_comb begin

    if(a && b && c && d) q=1;
    
    else q=0;

end


endmodule