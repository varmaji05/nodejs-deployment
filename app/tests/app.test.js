const request = require('supertest');
const app = require('../src/app');

describe('GET /health', () => {
  it('should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('status', 'UP');
  });
});

describe('GET /api/v1/todos', () => {
  it('should return list of todos', async () => {
    const res = await request(app).get('/api/v1/todos');
    expect(res.statusCode).toEqual(200);
    expect(Array.isArray(res.body)).toBeTruthy();
  });
});
