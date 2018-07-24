package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.ItemDao;
import com.freemind.model.Item;
import com.freemind.services.ItemService;

@Service("ItemService")
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDao itemDao;

	@Override
	public List<Item> getAllItemList() {
		return itemDao.getAllItemList();
	}

	@Override
	public Item getItemById(int id) {
		return itemDao.getItemById(id);
	}

	@Override
	public void save(Item item) {
		itemDao.save(item);
	}

	@Override
	public void update(Item item) {
		itemDao.update(item);
	}

	@Override
	public void deleteItemById(int id) {
		itemDao.deleteItemById(id);
	}

}
