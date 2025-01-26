
module  Traffic_Light_Controller_new(


    input clk,rst,
    output reg [2:0]light_path_left,           
    output reg [2:0]light_path_right,             
    output reg [2:0]light_straight,           
    output reg [2:0]light_back              
    );
    
    parameter  S_left=0, S_right=1, S_straight =2, S_back=3;
    reg [2:0] tme;
    reg[2:0] ps;
    parameter  sec_left=7,sec_right=5,sec_straight=4,sec_back=6;

    always @(posedge clk or posedge rst) begin
        if(rst==1)
        begin
            ps<=S_left;
            tme<=0;
        end
        else 
            
             case (ps)
                S_left  :if(tme<sec_left)
                            begin
                                ps<=S_left;
                                tme<=tme+1;
                            end
                            else
                            begin 
                                ps<=S_right;
                                tme<=0;
                            end
                S_right : if(tme<=sec_right)
                            begin
                                ps<=S_right;
                                tme<=tme+1;
                            end
                            else
                            begin 
                                ps<=S_straight;
                                tme<=0;
                            end
               S_straight : if(tme<=sec_straight)
                            begin
                                ps<=S_straight;
                                tme<=tme+1;
                            end
                            else
                            begin 
                                ps<=S_back;
                                tme<=0;
                            end
                S_back : if(tme<=sec_back)
                            begin
                                ps<=S_back;
                                tme<=tme+1;
                            end
                            else
                            begin 
                                ps<=S_left;
                                tme<=0;
                            end

                default: ps<=S_left;
             endcase

        
    end
      
    always @(ps) begin
        

               case(ps)
                     
                    S_left:
                    begin
                       light_path_left=3'b001;
                       light_path_right=3'b010;
                       light_straight=3'b100;
                       light_back=3'b100;
                    end
                    S_right:
                    begin 
                       light_path_left=3'b100;
                       light_path_right=3'b001;
                       light_straight=3'b010;
                       light_back=3'b100;
                    end
                    S_straight:
                    begin
                       light_path_left=3'b100;
                       light_path_right=3'b100;
                       light_straight=3'b001;
                       light_back=3'b010;
                    end
                    S_back:
                    begin
                       light_path_left=3'b010;
                       light_path_right=3'b100;
                       light_straight=3'b100;
                       light_back=3'b001;
                    end
                    default:
                    begin 
                       light_path_left=3'b000;
                       light_path_right=3'b000;
                       light_straight=3'b000;
                       light_back=3'b000;
                    end
                    endcase
            end                
              


endmodule
