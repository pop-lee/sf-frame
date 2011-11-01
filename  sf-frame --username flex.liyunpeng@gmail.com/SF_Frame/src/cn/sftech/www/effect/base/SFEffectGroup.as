package cn.sftech.www.effect.base
{

	public class SFEffectGroup
	{
		private var _showEffect : SFEffectBase;
		
		private var _hideEffect : SFEffectBase;
		
		public function SFEffectGroup()
		{
		}
		
		public function set showEffect(value : SFEffectBase) : void
		{
			_showEffect = value;
		}
		
		public function set hideEffect(value : SFEffectBase) : void
		{
			_hideEffect = value;
		}
	}
}