package cn.sftech.www.effect.base
{

	public class SFEffectGroup
	{
		private var _showEffect : SFEffect;
		
		private var _hideEffect : SFEffect;
		
		public function SFEffectGroup()
		{
		}
		
		public function set showEffect(value : SFEffect) : void
		{
			_showEffect = value;
		}
		
		public function set hideEffect(value : SFEffect) : void
		{
			_hideEffect = value;
		}
	}
}