module andsix (

    output logic q,

    input logic a,b,c,d,e,f

);


always_comb begin

    if(a && b && c && d && e && f) q=1;
    
    else q=0;

end


endmodule