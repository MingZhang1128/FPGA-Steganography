`timescale 1ns / 1ps

//encoder
module encoder(
input clk,rst, [5:0]Switches,
input [23:0]  message,
input [23:0] img,
output reg [23:0] stego_out,
input flagAV_edge_detected,flag_start_encoding,
output reg flag_starting_decoding
    );
reg [1:0] counter_0=0;
reg [2:0] counter_1=0;
reg [4:0] counter_2=0; 
reg [2:0] counter_3=0;
reg [3:0] counter_4=0; 
reg [2:0] counter_5=0;
reg [2:0] counter;
reg [2:0] x=0;
reg enable1;
reg enable2;
//integer f1;
//integer f2;
//integer f3;
//initial begin
//f1 = $fopen("C:\\Users\\SWB\\Desktop\\inputmsg.txt","w");
//f2= $fopen("C:\\Users\\SWB\\Desktop\\stegoimg.txt","w");
//f3= $fopen("C:\\Users\\SWB\\Desktop\\inputimg.txt","w");
//end
   always @(posedge clk,posedge rst)begin
   if(rst) begin
        stego_out<=0;
        counter_0<=0;
        counter_1<=0;
        counter_2<=0;
        counter_3<=0;
        counter_4<=0;
        counter_5<=0;   
        counter<=0;
        flag_starting_decoding<=0;    
        enable1<=0;
        enable2<=0;
    end
  
   else if(flag_start_encoding==1)begin // there is a stegoout as long as there is an input pixels 
     
 //   $fwrite(f3, "%h %h %h\n", img[23:16],img[15:8],img[7:0]) ;    
 //   $fwrite(f2,"%h %h %h\n", stego_out[23:16],stego_out[15:8],stego_out[7:0]);  
     enable1<=flagAV_edge_detected;
     enable2<=enable1;
   if (enable2==1)   begin
   flag_starting_decoding=1;
   
   case (Switches)
   
   //  condition 6 bit each pix
        1: begin  //sw0
      
             if(counter_0 ==0)begin        
                  stego_out<={{img[23:18],message[5:4]},{img[15:10],message[3:2]},{img[7:2],message[1:0]}};
                  counter_0=counter_0+1;
              end
              else if(counter_0 ==1)begin
                 stego_out<={{img[23:18],message[11:10]},{img[15:10],message[9:8]},{img[7:2],message[7:6]}};
                 counter_0=counter_0+1;                            
              end
              else if(counter_0 ==2)begin
                  stego_out<={{img[23:18],message[17:16]},{img[15:10],message[15:14]},{img[7:2],message[13:12]}};
                  counter_0=counter_0+1;                             
              end
              else if(counter_0 ==3)begin
                  stego_out<={{img[23:18],message[23:22]},{img[15:10],message[21:20]},{img[7:2],message[19:18]}};
                  counter_0<=0;                               
              end
        end
 
    // condition 3 bit each pix
         2: begin  
          
               if(counter_1 ==0)begin    
                    stego_out<={{img[23:17],message[2]},{img[15:9],message[1]},{img[7:1],message[0]}};
                    counter_1=counter_1+1;
                end
                else if(counter_1 ==1)begin
                   stego_out<={{img[23:17],message[5]},{img[15:9],message[4]},{img[7:1],message[3]}};
                   counter_1=counter_1+1;                            
                end
                else if(counter_1 ==2)begin
                    stego_out<={{img[23:17],message[8]},{img[15:9],message[7]},{img[7:1],message[6]}};
                    counter_1=counter_1+1;                             
                end
                else if(counter_1 ==3)begin
                    stego_out<={{img[23:17],message[11]},{img[15:9],message[10]},{img[7:1],message[9]}};
                    counter_1=counter_1+1;                               
                end
                else if(counter_1 ==4)begin
                    stego_out<={{img[23:17],message[14]},{img[15:9],message[13]},{img[7:1],message[12]}};
                    counter_1=counter_1+1;
                end
                else if(counter_1 ==5)begin
                        stego_out<={{img[23:17],message[17]},{img[15:9],message[16]},{img[7:1],message[15]}};
                        counter_1=counter_1+1;                             
                    end
                    else if(counter_1 ==6)begin
                        stego_out<={{img[23:17],message[20]},{img[15:9],message[19]},{img[7:1],message[18]}};
                        counter_1=counter_1+1;                               
                    end
                    else if(counter_1 ==7)begin
                        stego_out<={{img[23:17],message[23]},{img[15:9],message[22]},{img[7:1],message[21]}};
                        counter_1<=0;                                                
                end
          end

    //  condition 1 bit each pix blue
            4: begin   //sw2
   
                   if( counter_2 ==0)begin        
                        stego_out<={{img[23:17],message[0]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;
                    end
                    else if( counter_2 ==1)begin
                        stego_out<={{img[23:17],message[1]},{img[15:8]},{img[7:0]}};
                        counter_2= counter_2+1;                            
                    end
                    else if( counter_2 ==2)begin
                         stego_out<={{img[23:17],message[2]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;                             
                    end
                    else if( counter_2 ==3)begin
                         stego_out<={{img[23:17],message[3]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;                               
                    end
                    else if( counter_2 ==4)begin
                         stego_out<={{img[23:17],message[4]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;
                    end
                    else if( counter_2 ==5)begin
                          stego_out<={{img[23:17],message[5]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;                             
                    end
                    else if( counter_2 ==6)begin 
                         stego_out<={{img[23:17],message[6]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;                               
                    end
                    else if( counter_2 ==7)begin
                            stego_out<={{img[23:17],message[7]},{img[15:8]},{img[7:0]}};
                             counter_2= counter_2+1;                                                 
                    end   
                    else if( counter_2 ==8)begin    
                           stego_out<={{img[23:17],message[8]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;
                     end
                     else if( counter_2 ==9)begin
                         stego_out<={{img[23:17],message[9]},{img[15:8]},{img[7:0]}};
                         counter_2= counter_2+1;                            
                     end
                     else if( counter_2 ==10)begin
                      stego_out<={{img[23:17],message[10]},{img[15:8]},{img[7:0]}};
                      counter_2= counter_2+1;                             
                     end
                     else if( counter_2 ==11)begin
                          stego_out<={{img[23:17],message[11]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;                               
                     end
                     else if( counter_2 ==12)begin
                          stego_out<={{img[23:17],message[12]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;
                     end
                     else if( counter_2 ==13)begin
                       stego_out<={{img[23:17],message[13]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;                             
                     end
                     else if( counter_2 ==14)begin
                          stego_out<={{img[23:17],message[14]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;                               
                     end
                     else if( counter_2 ==15)begin
                          stego_out<={{img[23:17],message[15]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;                                                 
                     end    
                     else if( counter_2 ==16)begin 
                           stego_out<={{img[23:17],message[16]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;
                      end
                      else if( counter_2 ==17)begin
                          stego_out<={{img[23:17],message[17]},{img[15:8]},{img[7:0]}};
                          counter_2= counter_2+1;                            
                      end
                      else if( counter_2 ==18)begin
                           stego_out<={{img[23:17],message[18]},{img[15:8]},{img[7:0]}};
                           counter_2<= counter_2+1;                             
                      end
                      else if( counter_2 ==19)begin
                           stego_out<={{img[23:17],message[19]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;                               
                      end
                      else if( counter_2 ==20)begin
                           stego_out<={{img[23:17],message[20]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;
                      end
                      else if( counter_2 ==21)begin
                           stego_out<={{img[23:17],message[21]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;                             
                      end
                      else if( counter_2 ==22)begin
                           stego_out<={{img[23:17],message[22]},{img[15:8]},{img[7:0]}};
                           counter_2= counter_2+1;                               
                      end
                      else if( counter_2 ==23)begin
                           stego_out<={{img[23:17],message[23]},{img[15:8]},{img[7:0]}};
                           counter_2<=0;                                                 
                       end
                   end
 
   // condition 4 bit each pix
           8: begin   //sw3  
                   if( counter_3 ==0)begin     
                       // $fwrite(f1, "%h %h %h\n", message[23:16],message[15:8],message[7:0]) ; 
                       stego_out<={{img[23:18],message[3:2]},{img[15:9],message[1]},{img[7:1],message[0]}};
                       counter_3=counter_3+1;                      
                    end
                    else if(counter_3 ==1)begin
                       stego_out<={{img[23:18],message[7:6]},{img[15:9],message[5]},{img[7:1],message[4]}};   
                       counter_3=counter_3+1; 
                                              
                    end
                    else if(counter_3 ==2)begin
                        stego_out<={{img[23:18],message[11:10]},{img[15:9],message[9]},{img[7:1],message[8]}}; 
                        counter_3=counter_3+1;  
                                                  
                    end
                    else if(counter_3 ==3)begin
                        stego_out<={{img[23:18],message[15:14]},{img[15:9],message[13]},{img[7:1],message[12]}};  
                        counter_3=counter_3+1;  
                                                  
                    end
                    else if(counter_3 ==4)begin
                        stego_out<={{img[23:18],message[19:18]},{img[15:9],message[17]},{img[7:1],message[16]}};
                        counter_3=counter_3+1;
                        
                    end
                    else 
                    begin
                        stego_out<={{img[23:18],message[23:22]},{img[15:9],message[21]},{img[7:1],message[20]}};
                        counter_3<=0;                                                                                                   
                end 
            end
      
    // condition 2 bit (1r,1b)
        16: begin     //sw4       
                 if( counter_4 ==0)begin        
                     stego_out<={{img[23:17],message[1]},{img[15:8]},{img[7:1],message[0]}};
                     counter_4= counter_4+1;
                 end
                 else if( counter_4 ==1)begin
                     stego_out<={{img[23:17],message[3]},{img[15:8]},{img[7:1],message[2]}};
                     counter_4= counter_4+1;                            
                 end
                 else if( counter_4 ==2)begin
                      stego_out<={{img[23:17],message[5]},{img[15:8]},{img[7:1],message[4]}};
                      counter_4= counter_4+1;                             
                 end
                 else if( counter_4 ==3)begin
                      stego_out<={{img[23:17],message[7]},{img[15:8]},{img[7:1],message[6]}};
                      counter_4= counter_4+1;                               
                 end
                 else if( counter_4 ==4)begin
                      stego_out<={{img[23:17],message[9]},{img[15:8]},{img[7:1],message[8]}};
                      counter_4= counter_4+1;
                 end
                 else if( counter_4 ==5)begin
                          stego_out<={{img[23:17],message[11]},{img[15:8]},{img[7:1],message[10]}};
                          counter_4= counter_4+1;                             
                 end
                 else if( counter_4 ==6)begin
                      stego_out<={{img[23:17],message[13]},{img[15:8]},{img[7:1],message[12]}};
                      counter_4= counter_4+1;                               
                 end
                 else if( counter_4 ==7)begin
                      stego_out<={{img[23:17],message[15]},{img[15:8]},{img[7:1],message[14]}};
                      counter_4= counter_4+1;                                                 
                 end   
                 else if( counter_4 ==8)begin    
                   stego_out<={{img[23:17],message[17]},{img[15:8]},{img[7:1],message[16]}};
                   counter_4= counter_4+1;
                  end
                  else if( counter_4 ==9)begin
                      stego_out<={{img[23:17],message[19]},{img[15:8]},{img[7:1],message[18]}};
                      counter_4= counter_4+1;                            
                  end
                  else if( counter_4 ==10)begin
                       stego_out<={{img[23:17],message[21]},{img[15:8]},{img[7:1],message[20]}};
                       counter_4= counter_4+1;                             
                  end
                  else if( counter_4 ==11)begin
                     stego_out<={{img[23:17],message[23]},{img[15:8]},{img[7:1],message[22]}};
                     counter_4<=0;                               
                  end
                 end      
  // condition 5 bit each pix
              32: begin   //sw5      
                    if(counter_5 ==0)begin        
                         stego_out<={{img[23:18],message[4:3]},{img[15:9],message[2]},{img[7:2],message[1:0]}};
                         counter_5<=counter_5+1;        
                     end
                     else if(counter_5 ==1)begin
                        stego_out<={{img[23:18],message[9:8]},{img[15:9],message[7]},{img[7:2],message[6:5]}};
                        counter_5<=counter_5+1;                        
                     end
                     else if(counter_5 ==2)begin
                         stego_out<={{img[23:18],message[14:13]},{img[15:9],message[12]},{img[7:2],message[11:10]}};
                         counter_5<=counter_5+1;                             
                     end
                     else if(counter_5 ==3)begin
                         stego_out<={{img[23:18],message[19:18]},{img[15:9],message[17]},{img[7:2],message[16:15]}};
                         counter_5<=counter_5+1;                               
                     end
                      else if(counter_5 ==4)begin
                       stego_out<={{img[23:18],message[23:22]},{img[15:9],message[21]},{img[7:2],message[20]}};
                       counter_5<=0;         
                       end
                end
               endcase     
            end
      else begin    
              stego_out<=img; 
              flag_starting_decoding<=0;
         end
      end      
   end   
endmodule