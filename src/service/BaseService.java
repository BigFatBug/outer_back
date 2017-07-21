package service;

import java.util.ArrayList;
import java.util.Map;

import entity.User;

public interface BaseService<T> {
	public int insert(T t);
	public int update(T t);
	public int delete(int id);
	public ArrayList<T> find(Map map);
	public T findByIntId(int id);
	public T findByStringId(String t_id);
	public ArrayList<T> all();
}
