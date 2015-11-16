package co.com.jhilton.wiki.villains.data.impl;

import java.util.HashMap;
import java.util.Map;

import co.com.jhilton.wiki.villains.data.IVillainsDAO;
import co.com.jhilton.wiki.villains.domain.Villain;

public class VillainsInMemoryDAOImpl implements IVillainsDAO {

	private static Map<String, Villain> villainsRepository = new HashMap<String, Villain>();
	
	static {
		villainsRepository.put("Loki", new Villain("Loki", "Thor's evil brother"));
		villainsRepository.put("Me", new Villain("Me", "<img src=\"http://goo.gl/ICL6J7\""));
	}
	
	@Override
	public Villain getVillainByName(String name) {
		return villainsRepository.get(name);
	}

	@Override
	public int createVillain(Villain newVillain) {
		villainsRepository.put(newVillain.getName(), newVillain);
		return 1;
	}

}
