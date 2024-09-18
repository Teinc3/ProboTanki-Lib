package alternativa.tanks.models.battle.gui.chat
{
   import § !g§.§class for case§;
   import §1!F§.§@#+§;
   import §1!F§.§switch var super§;
   import §`#t§.§%!J§;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.userlabel.ChatUpdateEvent;
   
   public class §1$ § extends §@#+§
   {
      private static const §5#l§:int = 300;
      
      private static const §const set false§:int = 100;
      
      private static const §case catch get§:int = 5;
      
      private var buffer:Array;
      
      private var §set package in§:Boolean = true;
      
      private var §["H§:uint = 0;
      
      public function §1$ §()
      {
         this.buffer = [];
         super();
      }
      
      public function addLine(param1:String, param2:§class for case§, param3:String, param4:Boolean, param5:Boolean) : void
      {
         this.§"#8§();
         var _loc6_:§set package case§ = new §set package case§(param1,param2,param3,param4,param5);
         _loc6_.addEventListener(§%!J§.§null include§,this.§ #0§);
         this.§9$§(_loc6_);
         §'"D§(_loc6_);
         container.addEventListener(ChatUpdateEvent.UPDATE,this.§4b§);
      }
      
      private function §4b§(param1:ChatUpdateEvent) : void
      {
         if(this.§["H§ != 0)
         {
            clearTimeout(this.§["H§);
         }
         this.§["H§ = setTimeout(this.§8!D§,100);
      }
      
      private function §8!D§() : void
      {
         var _loc1_:§switch var super§ = null;
         this.§["H§ = 0;
         for each(_loc1_ in this.buffer)
         {
            if(_loc1_ is §set package case§)
            {
               §set package case§(_loc1_).alignChatUserLabel();
            }
         }
      }
      
      public function §use package throw§(param1:String) : void
      {
         this.§"#8§();
         var _loc2_:§break var native§ = new §break var native§(§5#l§,param1);
         _loc2_.addEventListener(§%!J§.§null include§,this.§ #0§);
         this.§9$§(_loc2_);
         §'"D§(_loc2_);
      }
      
      override public function §-M§(param1:Boolean = false) : §switch var super§
      {
         var _loc2_:§switch var super§ = super.§-M§();
         this.y += shift;
         if(param1)
         {
            this.buffer.shift();
         }
         return _loc2_;
      }
      
      public function §8#-§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§switch var super§ = null;
         this.§set package in§ = false;
         var _loc3_:int = this.buffer.length - container.numChildren;
         _loc1_ = 0;
         while(_loc1_ < container.numChildren)
         {
            _loc2_ = §switch var super§(container.getChildAt(_loc1_));
            _loc2_.§0#R§();
            _loc1_++;
         }
         _loc1_ = _loc3_ - 1;
         while(_loc1_ >= 0)
         {
            try
            {
               §3#N§(§switch var super§(this.buffer[_loc1_]));
            }
            catch(err:Error)
            {
            }
            _loc1_--;
         }
      }
      
      public function §return catch if§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§switch var super§ = null;
         this.§set package in§ = true;
         var _loc3_:int = container.numChildren - §case catch get§;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.§-M§();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < container.numChildren)
         {
            _loc2_ = §switch var super§(container.getChildAt(_loc1_));
            if(!_loc2_.alive)
            {
               this.§-M§();
               _loc1_--;
            }
            else
            {
               _loc2_.§package for use§();
            }
            _loc1_++;
         }
      }
      
      public function clear() : void
      {
         this.buffer.length = 0;
         var _loc1_:int = container.numChildren - 1;
         while(_loc1_ >= 0)
         {
            container.removeChildAt(_loc1_);
            _loc1_--;
         }
      }
      
      private function § #0§(param1:§%!J§) : void
      {
         if(this.§set package in§ && container.contains(param1.line))
         {
            this.§-M§();
         }
         param1.line.removeEventListener(§%!J§.§null include§,this.§ #0§);
      }
      
      private function §"#8§() : void
      {
         if(this.§set package in§ && container.numChildren > §case catch get§ || !this.§set package in§ && container.numChildren >= §const set false§)
         {
            this.§-M§();
         }
      }
      
      private function §9$§(param1:§switch var super§) : void
      {
         this.buffer.push(param1);
         if(this.buffer.length > §const set false§)
         {
            this.buffer.shift();
         }
      }
   }
}

