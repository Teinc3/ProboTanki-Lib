package §with for class§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §]2§.§@#w§;
   import §]2§.§final const false§;
   import alternativa.object.ClientObject;
   
   public class §7#i§ extends §final const false§ implements §@#w§, §implements var include§
   {
      public function §7#i§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§false set false§ = §false set false§(object.adapt(§false set false§));
         var _loc3_:§null var§ = new §null var§(getInitParam(),_loc2_,§80§(object.adapt(§80§)));
         param1.putParams(§null var§,_loc3_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         §null var§(param1.getParams(§null var§)).close();
      }
      
      public function §if var set§(param1:ClientObject) : §null var§
      {
         return §null var§(param1.getParams(§null var§));
      }
   }
}

