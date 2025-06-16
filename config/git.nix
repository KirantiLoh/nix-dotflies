{
	programs.git = {
		enable = true;
      		extraConfig = {
			user.name = "Maurice Yang";
      			user.email = "mauriceyangmy28@gmail.com";
        		init.defaultBranch = "main";
			pull = {
       			 	ff = "only";
        			rebase = false;
      			};
      		};
	};
}
