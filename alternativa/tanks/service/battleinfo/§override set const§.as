package alternativa.tanks.service.battleinfo
{
   import § !g§.§class for case§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controllers.battleinfo.BattleInfoDMController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoTeamController;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.LocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDMView;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import flash.events.EventDispatcher;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class §override set const§ extends EventDispatcher implements IBattleInfoFormService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "lobby";
      
      private var §continue package final§:BattleInfoDMController;
      
      private var §<#N§:BattleInfoTeamController;
      
      private var §`!<§:Boolean;
      
      private var §0#r§:Boolean;
      
      public function §override set const§()
      {
         super();
      }
      
      public function §3o§() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.addFormToStage();
         }
         if(this.§0#r§)
         {
            this.§<#N§.addFormToStage();
         }
      }
      
      public function removeFormFromStage() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.removeFormFromStage();
         }
         if(this.§0#r§)
         {
            this.§<#N§.removeFormFromStage();
         }
      }
      
      public function §set package default§(param1:BattleInfoDmParams) : void
      {
         if(this.§continue package final§ == null)
         {
            this.§continue package final§ = new BattleInfoDMController(new BattleInfoDMView(display,new LocaleBattleInfo()));
            this.§continue package final§.addEventListener(BattleInfoViewEvent.ENTER_DM,this.§9j§);
            this.§continue package final§.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.§+!x§();
         this.§`!<§ = true;
         this.§continue package final§.showForm(param1);
      }
      
      private function §9j§(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","DM");
      }
      
      public function §implements var function§(param1:BattleInfoTeamParams) : void
      {
         if(this.§<#N§ == null)
         {
            this.§<#N§ = new BattleInfoTeamController(new BattleInfoTeamView(display,new LocaleBattleInfo()));
            this.§<#N§.addEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.§<#N§.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.§+!x§();
         this.§0#r§ = true;
         this.§<#N§.showForm(param1);
      }
      
      public function §package for set§() : void
      {
         if(this.§<#N§ != null)
         {
            this.§<#N§.updateAvailableEnterInBattle();
         }
         if(this.§continue package final§ != null)
         {
            this.§continue package final§.updateAvailableEnterInBattle();
         }
      }
      
      private function onEnterTeam(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Team");
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Spectator");
      }
      
      public function §+!x§() : void
      {
         this.§false const§();
         this.§switch var each§();
      }
      
      private function §false const§() : void
      {
         if(this.§`!<§)
         {
            this.§`!<§ = false;
            this.§continue package final§.hideForm();
         }
      }
      
      private function §switch var each§() : void
      {
         if(this.§0#r§)
         {
            this.§0#r§ = false;
            this.§<#N§.hideForm();
         }
      }
      
      public function destroy() : void
      {
         if(this.§continue package final§ != null)
         {
            this.§continue package final§.removeEventListener(BattleInfoViewEvent.ENTER_DM,this.§9j§);
            this.§continue package final§.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.§continue package final§.destroy();
            this.§continue package final§ = null;
            this.§`!<§ = false;
         }
         if(this.§<#N§ != null)
         {
            this.§<#N§.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.§<#N§.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.§<#N§.destroy();
            this.§<#N§ = null;
            this.§0#r§ = false;
         }
      }
      
      public function updateName(param1:String) : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.updateName(param1);
         }
         if(this.§0#r§)
         {
            this.§<#N§.updateName(param1);
         }
      }
      
      public function updateTeamScore(param1:§class for case§, param2:int) : void
      {
         if(this.§0#r§)
         {
            this.§<#N§.updateTeamScore(param1,param2);
         }
      }
      
      public function addUserTeam(param1:BattleInfoUser, param2:§class for case§) : void
      {
         if(this.§0#r§)
         {
            this.§<#N§.addUserTeam(param1,param2);
         }
      }
      
      public function §1#F§(param1:BattleInfoUser) : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.addUser(param1);
         }
      }
      
      public function removeUser(param1:String) : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.removeUser(param1);
         }
         if(this.§0#r§)
         {
            this.§<#N§.removeUser(param1);
         }
      }
      
      public function updateUserScore(param1:String, param2:int) : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.updateUserScore(param1,param2);
         }
         if(this.§0#r§)
         {
            this.§<#N§.updateUserScore(param1,param2);
         }
      }
      
      public function updateUserSuspiciousState(param1:String, param2:Boolean) : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.updateUserSuspiciousState(param1,param2);
         }
         if(this.§0#r§)
         {
            this.§<#N§.updateUserSuspiciousState(param1,param2);
         }
      }
      
      public function swapTeams() : void
      {
         if(this.§0#r§)
         {
            this.§<#N§.swapTeams();
         }
      }
      
      public function roundStart() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.roundStart();
         }
         if(this.§0#r§)
         {
            this.§<#N§.roundStart();
         }
      }
      
      public function roundFinish() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.roundFinish();
         }
         if(this.§0#r§)
         {
            this.§<#N§.roundFinish();
         }
      }
      
      public function battleStop() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.battleStop();
         }
         if(this.§0#r§)
         {
            this.§<#N§.battleStop();
         }
      }
      
      public function §+#E§() : void
      {
         if(this.§`!<§)
         {
            this.§continue package final§.durationBattleNoSuppliesIsOverAboniment();
         }
         if(this.§0#r§)
         {
            this.§<#N§.durationBattleNoSuppliesIsOverAboniment();
         }
      }
      
      public function getBattleItemId() : String
      {
         if(this.§`!<§)
         {
            return this.§continue package final§.getBattleItemId();
         }
         if(this.§0#r§)
         {
            return this.§<#N§.getBattleItemId();
         }
         return null;
      }
   }
}

