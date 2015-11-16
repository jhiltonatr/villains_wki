package co.com.jhilton.wiki.villains.data;

import co.com.jhilton.wiki.villains.domain.Villain;

public interface IVillainsManager {

	Villain getVillainByName(String name);
	
	void createVillain(Villain newVillain);
}
