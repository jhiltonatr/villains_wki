package co.com.jhilton.wiki.villains.data;

import co.com.jhilton.wiki.villains.domain.Villain;

public interface IVillainsDAO {

	Villain getVillainByName(String name);
	
	int createVillain(Villain newVillain);
}
