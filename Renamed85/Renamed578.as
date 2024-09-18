package Renamed85
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.IShotModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.ShotModelBase;
   
   public class Renamed578 extends ShotModelBase implements IShotModelBase, Renamed10349
   {
      public function Renamed578()
      {
         super();
         _interfaces.push(IModel,IShotModelBase,Renamed10349);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:int) : void
      {
         var _loc5_:Renamed86 = new Renamed86(param4);
         _loc5_.Renamed3054.setNumber(param2);
         _loc5_.Renamed10197.setInt(2 * 180 * param2 / Math.PI);
         _loc5_.Renamed3052.setNumber(param3);
         _loc5_.Renamed10195.setInt(2 * 180 * param3 / Math.PI);
         param1.putParams(Renamed578,_loc5_);
      }
      
      public function Renamed10350(param1:ClientObject) : Renamed86
      {
         return param1.getParams(Renamed578) as Renamed86;
      }
   }
}

