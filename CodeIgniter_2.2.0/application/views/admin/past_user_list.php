<?php echo $this->load->view('_inc/header_thin');  ?>
<?php echo $this->load->view('_inc/nav_bar')?>
<div class="header-text-thin-square-2 header-text-uppercase">
	<p>lista de candidatos</p>
</div>
</div>
</div>

  <div id="content" class="content-thin">
    <div id="list-user">
      <table>
          <thead>
              <tr>
                  <th>Nome</th>
                  <th>Email</th>
                  <th></th>
                  <th>FeedBack</th>
                  <th>&nbsp</th>
             </tr>
          </thead>
          <tbody>
          <?php if(isset($users)){
              foreach ($users as $user) { ?>
                  <tr>
                      <td><?php echo $user->nome ;?> </td>
                      <td> <?php echo $user->email ;?></td>
                      <td><a href="<?php echo base_url();?>index.php/admin/past_check_member?id=<?php echo $user->id_login?>">Informações</a></td>
                      
                      <?php if($user->feedback){ ?>
                        <td><a href="<?php echo base_url() ?>index.php/feedback/past_show_feed?id=<?php echo $user->id_login?>"> <img src="<?php echo base_url();?>assets/images/button_light_accept.png" alt="" /></a></td>
                      <?php } else { ?>
                        <td><a href="<?php echo base_url() ?>index.php/feedback/past_show_feed?id=<?php echo $user->id_login?>"> <img src="<?php echo base_url();?>assets/images/button_dark_empty.png" alt="" /></a></td>
                      <?php } ?>
                      
                      <td><a onclick="confirmar('Deseja deletar este usuario ?', '<?php echo base_url().'index.php/usuario/delete?id='.$user->id_login?>')">
                        <img src="<?php echo base_url();?>assets/images/button_light_cancel.png" alt="" />
                      </a></td>
						<tr>
							<td id ="case" class="infouser-td" colspan="6">
								<div class="infouser-date">
									<img onclick="closeDate();" src="<?php echo base_url();?>/assets/images/button_close.png" alt="" />
								</div>
							</td>
						</tr>
                  </tr>
          <?php }} ?>
          </tbody>
      </table>
    </div>
  </div>

<?php echo $this->load->view('_inc/footer') ?>