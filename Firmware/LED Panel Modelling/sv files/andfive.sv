module andfive (

    output logic q,

    input logic a,b,c,d,e

);


always_comb begin

    if(a && b && c && d && e) q=1;
    
    else q=0;

end


endmodule