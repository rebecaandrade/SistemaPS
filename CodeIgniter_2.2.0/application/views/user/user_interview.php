<?php echo $this->load->view('_inc/header_large');?>


<div class="header-text-large-square-2 header-text-uppercase">
         <p>
             Entrevista
         </p>
       </div>
     </div>
   </div>


   <div id="content" class="content-large">
     <h3>Marque os dias que tem disponibilidade para a entrevista:</h3>
     <div id="interview">
       <table>
         <?php echo form_open('horario/save_interview_hours') ?>
         <thead>
         </thead>

         <tbody>
          <?php foreach ($weeks as $week) {

          ?>
           <tr>
               <td>&nbsp</td>
               <?php foreach ($week as $date) {
                ?>
               <td><?php echo $date['day'].'/'.$date['month'] ?></td>
               <?php }?>
           </tr>
           <tr>
            <td>&nbsp</td>
             <?php foreach ($week as $date) {
                ?>
               <td><?php echo $date['day_name'] ?></td>
               <?php }?>
           </tr>
            <tr>
                <td>08:00 - 9:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/8' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>09:00 - 10:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/9' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>10:00 - 11:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/10' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>11:00 - 12:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/11' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>14:00 - 15:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/14' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>15:00 - 16:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/15' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>16:00 - 17:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/16' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
            <tr>
                <td>17:00 - 18:00</td>
                <?php foreach ($week as $date) {
                  if($date['valid_date']){
                ?>
                <td><input type="checkbox" name="result[]" value=<?php echo $date['year'].'-'.$date['month'].'-'.$date['day'].'/17' ?>>&nbsp</td>
                <?php
                  }else{ ?>
                    <td>&nbsp</td>
                  <?php
                  }
                }
                ?>
            </tr>
         <?php } ?>

         </tbody>
         <input type="submit" value="enviar">
       </table>
       <?php echo form_close() ?>
     </div>
     <a href="#"><h3>Prefiro responder posteriormente</h3></a>
   </div>

    <?php echo $this->load->view('_inc/footer') ?>
