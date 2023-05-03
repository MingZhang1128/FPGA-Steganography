`timescale 1ns / 1ps
module Controller(
   input clk ,rst,[5:0]Switches,
   output  [15:0] add_img,
   output [15:0] add_imgencoder,
   output  [11:0] add_data,
   input flag_AV_edge_detected,flag_AV_starting_img_pixels
    );
    
reg [15:0] count_img;
reg [15:0] count_imgencoder;
reg [11:0] count_data;    
reg[5:0] c;
reg[9:0] msgcounter;
reg [1:0]counter;
///////////////////////////////////////////////////////////////
assign add_img=count_img;
assign add_imgencoder= count_imgencoder;
assign add_data=count_data;
always @(posedge clk, posedge rst)begin
    if(rst)begin
        count_img <= 0;
        count_data <= 0;
        msgcounter<=0;
        count_imgencoder<=0;        
        c<=0;
        counter<=0;  
    end
    else  begin   
   // 6 bit per pix
    case(Switches)
       1: begin
        count_img <= count_img+1;   
         if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
              if(counter<1)begin 
                  counter <=counter+1;
                  end else if (counter>=1) begin   
                     count_imgencoder <= count_imgencoder+1; 
                     if(flag_AV_edge_detected==1)begin //edge detection    
                        if(count_img[1:0]==2'b11) begin
                            msgcounter=msgcounter+1;
                            count_data <= count_data+1;
                end
              end
           end
        end
      end
    // 3 bit per pix  
       2:begin
     count_img <= count_img+1;
     if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
       if(counter<1)begin 
           counter <=counter+1;
           end else if (counter>=1) begin   
              count_imgencoder <= count_imgencoder+1; 
              if(flag_AV_edge_detected==1)begin //edge detection     
                    if(count_img[2:0]==3'b111) begin
                        msgcounter=msgcounter+1;
                         count_data <= count_data+1;   
                         end
                     end
                end
            end
        end
    //1 bit per pix
       4:begin
      count_img <= count_img+1;
        if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
          if(counter<1)begin 
              counter <=counter+1;
              end else if (counter>=1) begin   
                 count_imgencoder <= count_imgencoder+1; 
                 if(flag_AV_edge_detected==1)begin //edge detection    
                      c=c+1;  
                      if(c==24)begin
                        count_data <= count_data+1;
                        msgcounter=msgcounter+1;
                        c<=0; 
                  end 
               end 
           end
       end
     end
   // 4 bit (1r,1g,2b) 
       8:begin
       count_img <= count_img+1;
         if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
            if(counter<1)begin 
                counter <=counter+1;
                end else if (counter>=1) begin   
                   count_imgencoder <= count_imgencoder+1; 
                   if(flag_AV_edge_detected==1)begin //edge detection    
                        c=c+1;  
                        if (c==6) begin
                          count_data <= count_data+1; 
                          msgcounter=msgcounter+1;
                          c<=0;  
                      end
                   end 
                 end
               end
            end
    // 2 bit(1r,1b) 
       16:begin
       count_img <= count_img+1;
      if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
           if(counter<1)begin 
               counter <=counter+1;
               end else if (counter>=1) begin   
                  count_imgencoder <= count_imgencoder+1; 
                  if(flag_AV_edge_detected==1)begin //edge detection    
                       c=c+1;  
                       if(c==12) begin
                       count_data <= count_data+1; 
                       msgcounter=msgcounter+1;
                       c<=0;  
                end
              end        
           end
         end 
       end                 
   // 5 bit(2r,1g,2b) 
          32:begin 
          count_img <= count_img+1;
         if (flag_AV_starting_img_pixels==1)begin     //start of encoding pixels 
              if(counter<1)begin 
                  counter <=counter+1;
                  end else if (counter>=1) begin   
                     count_imgencoder <= count_imgencoder+1; 
                     if(flag_AV_edge_detected==1)begin //edge detection    
                          c=c+1;                   
                          if(c==5) begin
                              count_data <= count_data+1; 
                              msgcounter=msgcounter+1;
                              c<=0;
                   end
                 end             
               end
            end
          end     
        endcase 
      end   
    end  
 endmodule