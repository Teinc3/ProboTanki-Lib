package §switch const super§
{
   import §1!F§.§@#+§;
   import §1!F§.§switch var super§;
   import §`#t§.§%!J§;
   
   public class §switch for include§ extends §@#+§
   {
      public var §2#"§:int = 10;
      
      public function §switch for include§()
      {
         super();
         §default const continue§ = 6;
      }
      
      public function addLine(param1:§switch var super§) : void
      {
         var _loc2_:§switch var super§ = null;
         §'"D§(param1);
         if(container.numChildren > this.§2#"§)
         {
            _loc2_ = §-M§();
            if(_loc2_ != null)
            {
               _loc2_.removeEventListener(§%!J§.§null include§,this.§ #0§);
               _loc2_.removeEventListener(§%!J§.§try catch const§,this.updateUid);
            }
         }
         param1.addEventListener(§%!J§.§null include§,this.§ #0§);
         param1.addEventListener(§%!J§.§try catch const§,this.updateUid);
         param1.x = -param1.width - 10;
      }
      
      private function § #0§(param1:§%!J§) : void
      {
         if(container.contains(param1.line))
         {
            §-M§();
         }
         param1.line.removeEventListener(§%!J§.§null include§,this.§ #0§);
      }
      
      private function updateUid(param1:§%!J§) : void
      {
         var _loc2_:§switch var super§ = param1.line;
         _loc2_.x = -_loc2_.width - 10;
         _loc2_.removeEventListener(§%!J§.§try catch const§,this.§ #0§);
      }
   }
}

