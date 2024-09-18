package §super var native§
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.IShotModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.ShotModelBase;
   
   public class §%!&§ extends ShotModelBase implements IShotModelBase, §package var extends§
   {
      public function §%!&§()
      {
         super();
         _interfaces.push(IModel,IShotModelBase,§package var extends§);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:int) : void
      {
         var _loc5_:§return for while§ = new §return for while§(param4);
         _loc5_.§null const static§.setNumber(param2);
         _loc5_.§7"[§.setInt(2 * 180 * param2 / Math.PI);
         _loc5_.§;#O§.setNumber(param3);
         _loc5_.§="q§.setInt(2 * 180 * param3 / Math.PI);
         param1.putParams(§%!&§,_loc5_);
      }
      
      public function §var catch for§(param1:ClientObject) : §return for while§
      {
         return param1.getParams(§%!&§) as §return for while§;
      }
   }
}

