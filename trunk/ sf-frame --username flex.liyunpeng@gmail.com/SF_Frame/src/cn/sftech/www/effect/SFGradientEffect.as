package cn.sftech.www.effect
{
	import cn.sftech.www.effect.base.SFEffectBase;
	
	import com.greensock.data.TweenLiteVars;

	public class SFGradientEffect extends SFEffectBase
	{
		private var _alphaTo : Number;
		
		private var _alphaFrom : Number;
		
		public function SFGradientEffect()
		{
			super();
			vars = new TweenLiteVars();
		}
		
		public function set alphaTo(value : Number) : void
		{
			_alphaTo = value;
		}
		
		public function set alphaFrom(value : Number) : void
		{
			_alphaFrom = value;
		}
		
		override public function play():void
		{
			if(!isNaN(_alphaFrom))
				target.alpha = _alphaFrom;
			if(!isNaN(_alphaTo))
				vars.prop("alpha",_alphaTo);
			super.play();
		}
	}
}