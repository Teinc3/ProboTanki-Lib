package §with var import§
{
   import § !g§.§class for case§;
   import §3"f§.§2!Q§;
   import §5!y§.§false package for§;
   import alternativa.tanks.models.battle.battlefield.§for catch while§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§class set default§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§const set final§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.§&!O§;
   import assets.icons.BattleInfoIcons;
   import §break for null§.§'B§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class § #X§ extends Sprite implements §const set final§
   {
      private var §#!X§:§for catch while§;
      
      private var §-!'§:§2!Q§;
      
      private var §static for for§:§package for continue§;
      
      private var §implements set catch§:§continue package var§;
      
      private var §set const switch§:String;
      
      private var §4"S§:§class set default§;
      
      public function § #X§(param1:String, param2:int, param3:§'B§, param4:int, param5:§for catch while§, param6:Boolean)
      {
         super();
         this.§#!X§ = param5;
         this.§set const switch§ = param1;
         this.§=f§(param2,param3,param4,param6);
      }
      
      public function §+"l§(param1:§class set default§) : void
      {
         this.§4"S§ = param1;
         this.§in const each§();
      }
      
      public function §"!#§(param1:§class for case§) : void
      {
         §&!O§(this.§implements set catch§).showFlagAtBase(param1);
      }
      
      public function §while catch class§(param1:§class for case§) : void
      {
         §&!O§(this.§implements set catch§).showFlagCarried(param1);
      }
      
      public function §var const get§(param1:§class for case§) : void
      {
         §&!O§(this.§implements set catch§).showFlagDropped(param1);
      }
      
      public function §5"8§() : void
      {
         §false package for§(this.§implements set catch§).showFlagDropped();
      }
      
      public function §use for case§() : void
      {
         §false package for§(this.§implements set catch§).showFlagAtBase();
      }
      
      public function §continue catch import§() : void
      {
         §false package for§(this.§implements set catch§).showFlagCarried();
      }
      
      private function §=f§(param1:int, param2:§'B§, param3:int, param4:Boolean) : void
      {
         this.§use const extends§(param1,param2,param3,param4);
         this.§7"^§(0,0);
         this.§in const each§();
      }
      
      private function §use const extends§(param1:int, param2:§'B§, param3:int, param4:Boolean) : void
      {
         this.§-!'§ = new §2!Q§(this.§#!X§,param1,param2,param3,param4);
         addChild(this.§-!'§);
      }
      
      private function §7"^§(param1:int, param2:int) : void
      {
         if(this.§#!X§ == §for catch while§.DM)
         {
            this.§static for for§ = new §package for continue§(BattleInfoIcons.KILL_LIMIT);
            addChild(this.§static for for§);
         }
         else
         {
            this.§implements set catch§ = this.§["u§();
            this.§var catch while§(§class for case§.BLUE,param1);
            this.§var catch while§(§class for case§.RED,param2);
            addChild(DisplayObject(this.§implements set catch§));
         }
      }
      
      private function §["u§() : §continue package var§
      {
         switch(this.§#!X§)
         {
            case §for catch while§.TDM:
               return new §-#o§();
            case §for catch while§.CTF:
               return new §&!O§();
            case §for catch while§.§static switch§:
               return new §+"c§();
            case §for catch while§.AS:
               return new §false package for§();
            default:
               throw new Error();
         }
      }
      
      public function §^$"§(param1:String, param2:int) : void
      {
         if(this.§#!X§ == §for catch while§.DM || this.§#!X§ == §for catch while§.TDM)
         {
            this.§-!'§.§1E§(param2);
            if(this.§#!X§ == §for catch while§.DM && param1 == this.§set const switch§)
            {
               this.§static for for§.§in var switch§(param2);
            }
            this.§in const each§();
         }
      }
      
      public function §var catch while§(param1:§class for case§, param2:int) : void
      {
         this.§implements set catch§.§var catch while§(param1,param2);
         this.§-!'§.§1E§(param2);
         this.§in const each§();
      }
      
      public function §<!§(param1:int) : void
      {
         this.§-!'§.§>?§(param1);
         this.§in const each§();
      }
      
      public function §2!;§() : void
      {
         this.§-!'§.reset();
         if(this.§#!X§ == §for catch while§.DM)
         {
            this.§static for for§.§in var switch§(0);
         }
         else
         {
            this.§implements set catch§.§in var switch§(0,0);
         }
         this.§in const each§();
      }
      
      public function §function for with§(param1:Boolean) : void
      {
         this.§2!;§();
         this.§-!'§.§[F§(param1);
         this.§in const each§();
      }
      
      public function §set catch false§() : void
      {
         this.§-!'§.§default var extends§();
         this.§in const each§();
      }
      
      public function §in const each§() : void
      {
         this.§-!'§.§in const each§();
         var _loc1_:DisplayObject = this.§#!X§ == §for catch while§.DM ? this.§static for for§ : DisplayObject(this.§implements set catch§);
         _loc1_.x = this.§-!'§.width + 10;
         if(this.§4"S§ != null)
         {
            this.§4"S§.§]!1§(this);
         }
      }
      
      public function §const package null§(param1:int) : void
      {
         this.§-!'§.§const package null§(param1);
         this.§in const each§();
      }
      
      public function §"#"§() : void
      {
         this.§-!'§.§"#"§();
         this.§in const each§();
      }
      
      public function §#d§(param1:int) : void
      {
         this.§-!'§.§#d§(param1);
      }
      
      public function §do package final§() : void
      {
         this.§-!'§.§do package final§();
      }
   }
}

