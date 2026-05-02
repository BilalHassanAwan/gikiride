'use client';

import { useState } from 'react';
import { motion } from 'framer-motion';
import { Mail, Lock, ArrowRight, Github } from 'lucide-react';
import GlassCard from '../../../components/GlassCard';
import Link from 'next/link';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  return (
    <div className="container" style={{ 
      minHeight: 'calc(100vh - 72px)', 
      display: 'flex', 
      alignItems: 'center', 
      justifyContent: 'center',
      padding: '40px 24px'
    }}>
      <motion.div
        initial={{ y: 20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
        style={{ width: '100%', maxWidth: '450px' }}
      >
        <GlassCard>
          <div style={{ textAlign: 'center', marginBottom: '32px' }}>
            <h2 style={{ fontSize: '32px', marginBottom: '8px' }}>Welcome Back</h2>
            <p style={{ color: 'var(--text-muted)' }}>Sign in to your GIKI Ride account</p>
          </div>

          <form onSubmit={(e) => e.preventDefault()}>
            <div style={{ marginBottom: '20px' }}>
              <label style={{ display: 'block', marginBottom: '8px', fontSize: '14px', fontWeight: '500' }}>University Email</label>
              <div style={{ position: 'relative' }}>
                <Mail size={18} style={{ position: 'absolute', left: '16px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                <input 
                  type="email" 
                  placeholder="student.id@giki.edu.pk"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  style={{ 
                    width: '100%', 
                    padding: '12px 16px 12px 48px', 
                    background: 'rgba(255, 255, 255, 0.05)', 
                    border: '1px solid var(--surface-border)', 
                    borderRadius: '12px',
                    color: 'var(--text)',
                    outline: 'none'
                  }}
                />
              </div>
            </div>

            <div style={{ marginBottom: '24px' }}>
              <label style={{ display: 'block', marginBottom: '8px', fontSize: '14px', fontWeight: '500' }}>Password</label>
              <div style={{ position: 'relative' }}>
                <Lock size={18} style={{ position: 'absolute', left: '16px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                <input 
                  type="password" 
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  style={{ 
                    width: '100%', 
                    padding: '12px 16px 12px 48px', 
                    background: 'rgba(255, 255, 255, 0.05)', 
                    border: '1px solid var(--surface-border)', 
                    borderRadius: '12px',
                    color: 'var(--text)',
                    outline: 'none'
                  }}
                />
              </div>
            </div>

            <button className="btn-primary" style={{ width: '100%', justifyContent: 'center', padding: '14px' }}>
              Sign In <ArrowRight size={20} />
            </button>
          </form>

          <div style={{ margin: '24px 0', display: 'flex', alignItems: 'center', gap: '16px' }}>
            <div style={{ flex: 1, height: '1px', background: 'var(--surface-border)' }}></div>
            <span style={{ fontSize: '12px', color: 'var(--text-muted)', textTransform: 'uppercase' }}>or continue with</span>
            <div style={{ flex: 1, height: '1px', background: 'var(--surface-border)' }}></div>
          </div>

          <button style={{ 
            width: '100%', 
            display: 'flex', 
            alignItems: 'center', 
            justifyContent: 'center', 
            gap: '12px',
            padding: '12px',
            background: 'transparent',
            border: '1px solid var(--surface-border)',
            borderRadius: '12px',
            color: 'var(--text)',
            cursor: 'pointer',
            fontWeight: '500'
          }}>
            <Github size={20} />
            GitHub
          </button>

          <p style={{ marginTop: '24px', textAlign: 'center', color: 'var(--text-muted)', fontSize: '14px' }}>
            Don't have an account? <Link href="#" style={{ color: 'var(--primary)', textDecoration: 'none', fontWeight: '600' }}>Sign Up</Link>
          </p>
        </GlassCard>
      </motion.div>
    </div>
  );
}
