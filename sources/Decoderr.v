`timescale 1ns / 1ps

module Decoderr(
    input clk,rst,[5:0]Switches,
    input flag_enable_Decoder,
    input [23:0] stego_in,
    output reg [23:0] msg_out
    );

reg [23:0] out;
reg [1:0] counter_0=0;
reg [2:0] counter_1=0;
reg [4:0] counter_2=0;
reg [2:0] counter_3=0;
reg [3:0] counter_4=0; 
reg [2:0] counter_5=0;
reg [4:0] x=0;
reg  [1:0]counter;
/*integer file_id;
initial begin
 file_id=$fopen("C:\\Users\\SWB\\Desktop\\msg.txt","w");
end */

always @(posedge clk,posedge rst)begin
   if(rst) begin
        out<=0;
        counter_0<=0;
        counter_1<=0;
        counter_2<=0;
        counter_3<=0;
        counter_4<=0;
        counter_5<=0;         
        msg_out<=0;

   end
 else if (flag_enable_Decoder==1)begin
case(Switches)
 // condition 6 bit each pix
        1: begin //sw0
   
            if(counter_0 ==0)begin 
                  msg_out<=out;                      
                out[5:0]<={stego_in[17:16],stego_in[9:8],stego_in[1:0]};
                counter_0<=counter_0+1;
            end           
               
            else if(counter_0 ==1)begin
               out[11:6]<={stego_in[17:16],stego_in[9:8],stego_in[1:0]};
               counter_0<=counter_0+1;
                                      
            end                   
                
            else if(counter_0 ==2)begin
                out[17:12]<={stego_in[17:16],stego_in[9:8],stego_in[1:0]};
                counter_0<=counter_0+1;
            end
            
            else if(counter_0 ==3)begin
                 out[23:18]<={stego_in[17:16],stego_in[9:8],stego_in[1:0]};
                 counter_0<=counter_0+1;
                  counter_0<=0;
     
             end                                                               
      end
  // condition 3 bit each pix
            2: begin  //sw1
   
                 if(counter_1 ==0)begin 
                       msg_out<=out;                         
                     out[2:0]<={stego_in[16],stego_in[8],stego_in[0]};
                     counter_1<=counter_1+1;
                 end           
                    
                 else if(counter_1 ==1)begin
                    out[5:3]<={stego_in[16],stego_in[8],stego_in[0]};
                    counter_1<=counter_1+1;
                                           
                 end                   
                     
                 else if(counter_1 ==2)begin
                     out[8:6]<={stego_in[16],stego_in[8],stego_in[0]};
                     counter_1<=counter_1+1;
                 end
                 
                 else if(counter_1 ==3)begin
                      out[11:9]<={stego_in[16],stego_in[8],stego_in[0]};
                      counter_1<=counter_1+1;     
                  end
                else if(counter_1 ==4)begin
                    out[14:12]<={stego_in[16],stego_in[8],stego_in[0]};
                    counter_1<=counter_1+1;
                end
                 else if(counter_1 ==5)begin
                  out[17:15]<={stego_in[16],stego_in[8],stego_in[0]};
                  counter_1<=counter_1+1;
              end  
                else if(counter_1 ==6)begin
                out[20:18]<={stego_in[16],stego_in[8],stego_in[0]};
                counter_1<=counter_1+1;
            end  
              else if(counter_1 ==7)begin
                  out[23:21]<={stego_in[16],stego_in[8],stego_in[0]};
                  counter_1<=counter_1+1;
                  counter_1<=0;
              end 
           end
           
     // condition 1 bit each pix blue
 
            4: begin //sw2
 
                if(counter_2 ==0)begin 
                      msg_out<=out;                         
                    out[0]<={stego_in[16]};
                    counter_2<=counter_2+1;
                end           
                   
                else if(counter_2 ==1)begin
                   out[1]<={stego_in[16]};
                   counter_2<=counter_2+1;
                                          
                end                   
                    
                else if(counter_2 ==2)begin
                    out[2]<={stego_in[16]};
                    counter_2<=counter_2+1;
                end
                
                else if(counter_2 ==3)begin
                     out[3]<={stego_in[16]};
                     counter_2<=counter_2+1;     
                 end
                   else if(counter_2 ==4)begin
                     out[4]<={stego_in[16]};
                      counter_2<=counter_2+1;
                  end
                else if(counter_2 ==5)begin
                   out[5]<={stego_in[16]};
                   counter_2<=counter_2+1;
               end
                else if(counter_2 ==6)begin
                   out[6]<={stego_in[16]};
                    counter_2<=counter_2+1;
                end
                    else if(counter_2 ==7)begin
                     out[7]<={stego_in[16]};
                     counter_2<=counter_2+1;
                 end
                 else if(counter_2 ==8)begin
                      out[8]<={stego_in[16]};
                      counter_2<=counter_2+1;
                  end
                  else if(counter_2 ==9)begin
                   out[9]<={stego_in[16]};
                   counter_2<=counter_2+1;
               end
                 else if(counter_2 ==10)begin
                 out[10]<={stego_in[16]};
                  counter_2<=counter_2+1;
              end
                 else if(counter_2 ==11)begin
                 out[11]<={stego_in[16]};
                 counter_2<=counter_2+1;
             end  
                else if(counter_2 ==12)begin
                out[12]<={stego_in[16]};
                counter_2<=counter_2+1;
            end 
            else if(counter_2 ==13)begin
               out[13]<={stego_in[16]};
               counter_2<=counter_2+1;
           end 
           else if(counter_2 ==14)begin
              out[14]<={stego_in[16]};
              counter_2<=counter_2+1;
          end 
          else if(counter_2 ==15)begin
             out[15]<={stego_in[16]};
             counter_2<=counter_2+1;
         end 
         else if(counter_2 ==16)begin
             out[16]<={stego_in[16]};
             counter_2<=counter_2+1;
         end 
         else if(counter_2 ==17)begin
             out[17]<={stego_in[16]};
             counter_2<=counter_2+1;
         end 
         else if(counter_2 ==18)begin
             out[18]<={stego_in[16]};
             counter_2<=counter_2+1;
         end 
         else if(counter_2 ==19)begin
              out[19]<={stego_in[16]};
              counter_2<=counter_2+1;
                 end 
         else if(counter_2 ==20)begin
              out[20]<={stego_in[16]};
              counter_2<=counter_2+1;
             end 
             else if(counter_2 ==21)begin
                out[21]<={stego_in[16]};
                counter_2<=counter_2+1;
             end 
             else if(counter_2 ==22)begin
             out[22]<={stego_in[16]};
             counter_2<=counter_2+1;
             end 
             else if(counter_2 ==23)begin
             out[23]<={stego_in[16]};
             counter_2<=counter_2+1;
             counter_2<=0;
             end 
          end
  // condition 4 bit (1r 1g 2b)
       8: begin //sw3
 
                 if(counter_3 ==0)begin //extraction of 4 bit/pix case 3
                     msg_out<=out;                 
                //    $fwrite(file_id,"%h %h %h\n", msg_out[23:16],msg_out[15:8],msg_out[7:0] );
                           
                     out[3:0]<={stego_in[17:16],stego_in[8],stego_in[0]};
                     counter_3<=counter_3+1;
                 end           
                 else if(counter_3 ==1)begin
                    out[7:4]<={stego_in[17:16],stego_in[8],stego_in[0]};
                    counter_3<=counter_3+1;
                 end                   
                 else if(counter_3 ==2)begin
                     out[11:8]<={stego_in[17:16],stego_in[8],stego_in[0]};
                     counter_3<=counter_3+1;
                 end
                 else if(counter_3 ==3)begin
                      out[15:12]<={stego_in[17:16],stego_in[8],stego_in[0]};
                      counter_3<=counter_3+1;     
                  end
                 else if(counter_3 ==4)begin
                     out[19:16]<={stego_in[17:16],stego_in[8],stego_in[0]};
                     counter_3<=counter_3+1;     
                 end 
                 else if(counter_3 ==5)begin
                        out[23:20]<={stego_in[17:16],stego_in[8],stego_in[0]};
                        counter_3<=counter_3+1;
                        counter_3<=0;     
                 end                                                             
              end 

   // condition 2 bit (1r,1b)
 
             16:begin //sw4
       
                  if(counter_4 ==0)begin 
                        msg_out<=out;                         
                      out[1:0]<={stego_in[16],stego_in[0]};
                      counter_4<=counter_4+1;
                  end           
                     
                  else if(counter_4 ==1)begin
                     out[3:2]<={stego_in[16],stego_in[0]};
                     counter_4<=counter_4+1;
                                            
                  end                   
                      
                  else if(counter_4 ==2)begin
                      out[5:4]<={stego_in[16],stego_in[0]};
                      counter_4<=counter_4+1;
                  end
                  
                  else if(counter_4 ==3)begin
                 out[7:6]<={stego_in[16],stego_in[0]};
                   counter_4<=counter_4+1;     
                   end 
                   else if(counter_4 ==4)begin
                     out[9:8]<={stego_in[16],stego_in[0]};
                     counter_4<=counter_4+1;     
                 end 
                 else if(counter_4 ==5)begin
                       out[11:10]<={stego_in[16],stego_in[0]};
                   counter_4<=counter_4+1;     
               end  
               else if(counter_4 ==6)begin
                         out[13:12]<={stego_in[16],stego_in[0]};
                         counter_4<=counter_4+1;     
                     end  
                 else if(counter_4 ==7)begin
                       out[15:14]<={stego_in[16],stego_in[0]};
                       counter_4<=counter_4+1;     
                   end  
                   else if(counter_4 ==8)begin
                     out[17:16]<={stego_in[16],stego_in[0]};
                     counter_4<=counter_4+1;     
                 end
                  else if(counter_4 ==9)begin
                out[19:18]<={stego_in[16],stego_in[0]};
                counter_4<=counter_4+1;     
             end 
                 else if(counter_4 ==10)begin
                   out[21:20]<={stego_in[16],stego_in[0]};
                   counter_4<=counter_4+1;     
               end 
                else if(counter_4 ==11)begin
                  out[23:22]<={stego_in[16],stego_in[0]};
                  counter_4<=counter_4+1; 
                  counter_4<=0;    
              end           
           end
  // condition 5 bit (2r,1g,2b)
         
      32: begin //sw5
     
                  if(counter_5 ==0)begin // case SW5 extraction 5 bits/pix
                        msg_out<=out;                         
                      out[4:0]<={stego_in[17:16],stego_in[8],stego_in[1:0]};
                      counter_5<=counter_5+1;
                  end           
                    
                  else if(counter_5 ==1)begin
                     out[9:5]<={stego_in[17:16],stego_in[8],stego_in[1:0]};
                     counter_5<=counter_5+1;
                                           
                  end                   
                     
                  else if(counter_5 ==2)begin
                      out[14:10]<={stego_in[17:16],stego_in[8],stego_in[1:0]};
                      counter_5<=counter_5+1;
                  end
                 
                  else if(counter_5 ==3)begin
                       out[19:15]<={stego_in[17:16],stego_in[8],stego_in[1:0]};
                       counter_5<=counter_5+1;     
                   end  
                   else if(counter_5 ==4)begin
                          out[23:20]<={stego_in[17:16],stego_in[8],stego_in[0]};
                          counter_5<=counter_5+1;  
                          counter_5<=0; 
                            
                           end                                                                                               
                    end          
            endcase
       end
   end
endmodule